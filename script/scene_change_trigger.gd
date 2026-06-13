extends Area3D


@export var scene_name : String

func enter_trigger(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/" +scene_name + ".tscn")
