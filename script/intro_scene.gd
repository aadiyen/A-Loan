extends Node3D

func _ready():
	$AnimationPlayer.play("car")
	await get_tree().create_timer(11.0,false).timeout
	$cutscene_ui/AnimationPlayer.play("fade") # fade the game when car goes by
	await get_tree().create_timer(1.0,false).timeout
	get_tree().change_scene_to_file("res://scenes/world.tscn")
