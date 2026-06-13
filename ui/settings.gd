extends CanvasLayer

var player_head



func _ready() -> void:
	if get_tree().current_scene.name == "world":
		player_head = get_tree().current_scene.get_node("player/fp_camera")




func set_visuals(value):
	get_viewport().scaling_3d_scale = value
	


func set_vsync(toggle):
	if !toggle:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		print("v sync disabled")
	elif toggle:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		print("vsync enabled")
	

	
	
func set_master_volume(value): # set the master value
	AudioServer.set_bus_volume_db(0,linear_to_db(value))


func set_sfx_value(value): # set the sfx value
	AudioServer.set_bus_volume_db(1,linear_to_db(value))
	
	
func music_value(value):
	AudioServer.set_bus_volume_db(2,linear_to_db(value))
	
	
func set_sensitivity(value): # set the player head aka fp camera sesitivity
	if player_head !=null:
		player_head.sensitivity = value
	
func set_window(index):
	print("window mode changed")
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif index == 2:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		print("kaam hee na kiya bhai")

func set_fps(index):
	if index == 0:
		Engine.max_fps = 30
	elif index == 1:
		Engine.max_fps = 60
	elif index == 2:
		Engine.max_fps = 0
