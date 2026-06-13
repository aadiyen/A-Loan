extends Control

@onready var safe_anim = get_tree().current_scene.get_node("game_house/safe/AnimationPlayer") # node for safe animation
@onready var rng = RandomNumberGenerator.new() # generate new random numbers for safe passcode
@onready var code_paper = get_tree().current_scene.get_node("code_paper") # node for code password

var safe_password



var safe_interacted = false


func _ready() -> void:
	$fade_ui/AnimationPlayer.play("fade") # play fade when game start
	#print(get_tree().current_scene.get_children())
	$safe_ui.visible = false
	#$main_menu.visible = false # make the main menu invisible at start
	$pause_menu.visible = false
	$settings.visible = false # make the settings value visibility disable
	$controls.visible = false # makes the controls visibility disable
	set_task("Ring the door bell")
	
	var p1 = rng.randi_range(0,9)
	var p2 = rng.randi_range(0,9)
	var p3 = rng.randi_range(0,9)
	var p4 = rng.randi_range(0,9)
	safe_password = str(p1) + str(p2) + str(p3) + str(p4)
	code_paper.get_node("code_text").mesh.text = safe_password # safe password ko visible krega mesh m 
	print(safe_password)
	await get_tree().create_timer(1.0,false).timeout
	$fade_ui.visible = false
	
	







	

func resume_game():
	get_tree().paused = false
	$pause_menu.visible  = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func quit_game():
	get_tree().quit()
	
	
	
func open_settings():
	$pause_menu.visible = false
	$settings.visible = true
	
func close_settings():
	$pause_menu.visible = true
	$settings.visible = false
		
	
	
func open_controls():
	$pause_menu.visible = false
	$controls.visible = true
	
	

func close_controls():
	$pause_menu.visible = true
	$controls.visible = false ##



func open_main_menu():
	get_tree().paused = false
	$pause_menu.visible = false
	
	
	get_tree().change_scene_to_file("res://ui/main_menu.tscn") #
	
	
	
	
func open_safe_password():
	if !safe_interacted:
		safe_interacted = true
		$safe_ui.visible = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # set mouse mode when safe is visible
		
func confirm_password():
	if $safe_ui/password.text == safe_password:
		#if safe_anim == null:
			#print("safe null h")
			
		safe_anim.play("open")
		safe_interacted = false
		exit_safe()



func exit_safe():
	safe_interacted = false
	$safe_ui.visible = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # again to captured mouse mode when resumed
	
	
	
	
func set_task(task_text : String):  # task text vivible when scene triggers
	$task_ui/task_text.text = task_text





func _process(delta: float) -> void:

	if Input.is_action_just_pressed("paused") and !$safe_ui.visible and !$settings.visible and !$controls.visible :
		$pause_menu.visible = !$pause_menu.visible
		get_tree().paused = $pause_menu.visible # pause the game when paused wow
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # we can toggle the mouse when paused
		if !get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		
