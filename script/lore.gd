extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("lore")
	await get_tree().create_timer(7.0,false).timeout
	get_tree().change_scene_to_file("res://scenes/intro_scene.tscn")
	
