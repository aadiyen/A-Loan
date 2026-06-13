extends Control

func _ready() -> void:
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(8.0,false).timeout
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")

	
	
