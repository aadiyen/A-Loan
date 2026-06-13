extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("death")
	await get_tree().create_timer(5.0,true).timeout
	#get_tree().quit()
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
