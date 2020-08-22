extends State

# Initialize the state. E.g. change the animation
func enter():
	owner.get_node("Animation").play("despawn")

func _on_animation_finished():
	owner.queue_free()
