extends Node3D

@export var on = false
@export var on_mat : StandardMaterial3D
@export var off_mat : StandardMaterial3D
@export var light_bulb : Node3D

func _ready() -> void:
	if !on:
		light_bulb.get_node("Light").material_override = off_mat
	if on:
		light_bulb.get_node("Light").material_override = on_mat
	light_bulb.get_node("OmniLight").visible = on


func toggle_light():
	on = !on
	if on:
		$on.visible = true
		$off.visible = false
		$button.play()       # play button sound
		light_bulb.get_node("Light").material_override = on_mat
	if !on:
		$on.visible = false
		$off.visible = true
		$button.play()        # play button sound
		light_bulb.get_node("Light").material_override = on_mat
	light_bulb.get_node("OmniLight").visible = on

		
