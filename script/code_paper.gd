extends RigidBody3D

@export var positions : Array[Node3D]
@export var door : Node3D # to assign the door to the key

@onready var rng = RandomNumberGenerator.new()
var pos_obj
const GRAVITY : int = 1000


func pickup_key():
	$key_pickup.play()
	door.locked = false
	queue_free()
	


func hit_obj(body):  # this function make the code paper in the contact of the body when came in contact
	pos_obj = body
	freeze = true

#
func _physics_process(delta: float) -> void:
	if pos_obj != null:
		global_transform.origin = pos_obj.global_transform.origin



func _ready() -> void:
	var chance = rng.randi_range(0,positions.size()-1) # set the positon of the passcodde through the node3D
	global_transform.origin = positions[chance].global_transform.origin
	print(str(chance))
	#visible = false
	if name != "key":
		visible = false
	if chance > 9 : # makes the other non interactive code static body very important
		disconnect("body_entered",Callable(self,"hit_obj"))
		
	
	
	
	
	
	
