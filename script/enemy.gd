extends CharacterBody3D

@onready var footstep: Timer = $footstep
@export var patrol_destination : Array[Node3D]
@onready var player = get_tree().current_scene.get_node("player")
@onready var nav = $NavigationAgent3D
var speed = 5.0
@onready var rng = RandomNumberGenerator.new()
var destination
var chasing = false
var killed = false
var destination_value

var last_position = Vector3.ZERO
var stuck_timer = 0.0
var STUCK_TIME = 2.5
var STUCK_THRESHOLD = 0.1
var chase_timer = 0.0  


func _ready() -> void:
	$jessy/AnimationPlayer.play("idle")
	last_position = global_position
	nav.navigation_finished.connect(_on_destination_reached)
	footstep.wait_time = 1.16
	footstep.one_shot = false
	footstep.timeout.connect(_on_footstep)
	pick_destination()


func _on_footstep():
	if killed:
		footstep.stop()
		return
	if chasing:
		footstep.wait_time = 1.16 / 2.5  
	else:
		footstep.wait_time = 1.16 / 1.3  
	$jessy/body/Sphere/walk.play()


func _on_destination_reached():
	$jessy/AnimationPlayer.play("idle")
	footstep.stop()
	await get_tree().create_timer(3.0).timeout
	pick_destination(destination_value)


func _process(delta: float) -> void:
	if !killed:
		if !chasing:
			if $jessy/AnimationPlayer.speed_scale != 1.3:
				$jessy/AnimationPlayer.speed_scale = 1.3  
			if speed != 4.0:
				speed = 4.0  
		if chasing:
			if $jessy/AnimationPlayer.speed_scale != 2.5:
				$jessy/AnimationPlayer.speed_scale = 2.5  #  chase fast
			if speed != 3.5:
				speed = 3.5  # chase speed  alag

		if chasing:
			if chase_timer < 15.0:  #  15 se badhakar 25 seconds
				chase_timer += 1 * delta
			else:
				chase_timer = 0.0
				if $killcast/killcast:
					$killcast/killcast.enabled = false
				chasing = false
				pick_destination()

		if destination != null:
			if velocity.length() > 0.1:
				var look_dir = lerp_angle(global_rotation.y, atan2(-velocity.x, -velocity.z), 0.1)
				global_rotation.y = look_dir


func chase_player(chasecast: RayCast3D):
	if chasecast.is_colliding():
		var hit = chasecast.get_collider()
		if hit.name == "player":
			if !chasing:
				$jessy/AnimationPlayer.play("walk")
				chasing = true
				destination = player
				footstep.wait_time = 1.16 / 2.5
				if footstep.is_stopped():
					footstep.start()


func kill_player():
	if !$killcast/killcast.enabled:
		$killcast/killcast.enabled = true
	$killcast.look_at(player.global_transform.origin)
	if $killcast/killcast.is_colliding():
		var hit = $killcast/killcast.get_collider()
		if hit.name == "player" and !killed:
			killed = true
			footstep.stop()
			$jessy/AnimationPlayer.play("jumpscare")
			$jumpscare.play()
			$jessy/jumpscarecam.current = true
			$jessy/AnimationPlayer.speed_scale = 2
			player.process_mode = Node.PROCESS_MODE_DISABLED
			await get_tree().create_timer(4.0, false).timeout
			get_tree().change_scene_to_file("res://scenes/death.tscn")


func _physics_process(delta: float) -> void:
	if !killed:
		if chasing:
			kill_player()
		chase_player($chasecast)
		chase_player($chasecast2)
		chase_player($chasecast3)
		chase_player($chasecast4)
		chase_player($chasecast5)
		if destination != null:
			update_target_location()
			var current_location = global_transform.origin
			var next_location = nav.get_next_path_position()
			var new_velocity = (next_location - current_location).normalized() * speed
			velocity = velocity.move_toward(new_velocity, 0.25)
			move_and_slide()
			check_stuck(delta)


func check_stuck(delta):
	var moved = global_position.distance_to(last_position)
	if moved < STUCK_THRESHOLD:
		stuck_timer += delta
		if stuck_timer >= STUCK_TIME:
			$jessy/AnimationPlayer.play("idle")
			footstep.stop()
			stuck_timer = 0.0
			last_position = global_position
			pick_destination(destination_value)
	else:
		stuck_timer = 0.0
		last_position = global_position


func pick_destination(dont_choose = null):
	if !chasing and !killed:
		$jessy/AnimationPlayer.play("walk")
		footstep.wait_time = 1.16 / 1.3
		if footstep.is_stopped():
			footstep.start()
		var num = rng.randi_range(0, patrol_destination.size() - 1)
		destination_value = num
		destination = patrol_destination[num]
		if destination != null and dont_choose != null and destination == patrol_destination[dont_choose]:
			if dont_choose < 1:
				destination = patrol_destination[dont_choose + 1]
			elif dont_choose > 0 and dont_choose <= patrol_destination.size() - 1:
				destination = patrol_destination[dont_choose - 1]


func update_target_location():
	nav.target_position = destination.global_transform.origin
