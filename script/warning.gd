extends Control


func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("fade")
	await get_tree().create_timer(7.0,false).timeout
	get_tree().change_scene_to_file("res://scenes/lore.tscn")
