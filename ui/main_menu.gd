extends CanvasLayer

@export var control = Node3D



#func _ready() -> void:
	#$controls.visible = false



func open_controls():
	$main_menu.visible = false
	$controls.visible = true
	
	

func close_controls():
	$main_menu.visible = true
	$controls.visible = false




func start_game():
	get_tree().change_scene_to_file("res://scenes/warning.tscn")
	
func quit_game():
	get_tree().quit()



func open_settings():
	#$main_menu.visible = false
	$settings2.visible = true

func exit_settings():
	$settings2.visible = false
	
	
	
func open_control():
	$controls.visible = true
	
	
func close_control():
	$controls.visible = false
	
	
	
func show_credit():
	$Credits.visible = true
	
func exit_credit():
	$Credits.visible = false
	
	
	
	
	
	
	
	
