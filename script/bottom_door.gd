extends Node3D

var opened = false
@export var locked = false
@export var open_sound: AudioStreamPlayer3D
@export var close_sound: AudioStreamPlayer3D

func _play_open_sound():
	if open_sound:
		open_sound.play()

func _play_close_sound():
	if close_sound:
		close_sound.play()

func ai_enable_door(body):
	if body.name == "enemy" and !locked and $AnimationPlayer.current_animation != "open":
		opened = true
		_play_open_sound()
		$AnimationPlayer.play("open")

func disable_door(body):
	if body.name == "enemy" and !locked and $AnimationPlayer.current_animation != "open":
		opened = false
		_play_close_sound()
		$AnimationPlayer.play_backwards("open")

func toggle_door():
	if locked:
		return
	if $AnimationPlayer.current_animation != "open":
		opened = !opened
	
	if opened:
		_play_open_sound()
		$AnimationPlayer.play("open")
		$open.play() # play the fridge open sound
	else:
		_play_close_sound()
		$AnimationPlayer.play_backwards("open")
		$open.play() # play the same sound of the fridge haha
