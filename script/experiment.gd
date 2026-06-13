extends Node3D

var opened = false
@export var locked = false


func ai_enable_door(body):
	if body.name == "enemy" and !locked and $AnimationPlayer.current_animation != "open" :
		opened = true
		if has_node("hinge/open"):
			$AnimationPlayer.play("open")
		$hinge/open.play()
		
	
	

		
func disable_door(body):
	if body.name == "enemy" and !locked and $AnimationPlayer.current_animation != "open":
		opened = false
		if has_node("hinge/close"):
			$hinge/open.play()
		$AnimationPlayer.play_backwards("open")
		



func toggle_door():
	if locked:
		return
	if $AnimationPlayer.current_animation != "open" :#and !locked: 
		opened = !opened
	
	if opened:
			if has_node("hinge/open"):
				$hinge/open.play()
			$AnimationPlayer.play("open")
		
	else:
			if has_node("hinge/close"):
				$hinge/open.play()
			$AnimationPlayer.play_backwards("open")
		
