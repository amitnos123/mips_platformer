extends "res://State Machine/state.gd"

# Initialize the state. E.g. change the animation
func enter():
	owner.get_node("Animation").play("picked")
	return

func _on_animation_finished():
	owner.queue_free()
	return
