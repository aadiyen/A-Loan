extends Area3D

@onready var ui = get_tree().current_scene.get_node("player/player_ui")
@export var task_text : String
@export var enable_code : bool # dont want to enable the code before task trigger 
var triggered = false



func enter_trigger(body):
	if body.name == "player" and !triggered:
		triggered = true
		ui.set_task(task_text)
	if enable_code:
		get_tree().current_scene.get_node("enemy").process_mode = Node.PROCESS_MODE_INHERIT
		get_tree().current_scene.get_node("enemy").visible = true
		get_tree().current_scene.get_node("code_paper").visible = true # enable the visibility of the code when task triggers
