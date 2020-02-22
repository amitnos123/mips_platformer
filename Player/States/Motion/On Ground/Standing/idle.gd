extends "res://Player/States/Motion/On Ground/Standing/standing.gd"

# Initialize the state. E.g. change the animation
func enter():
	velocity = Vector2()
	owner.get_node("AnimatedSprite").play("idle")
	return

func exit():
	return .exit()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if input_direction.x:
		emit_signal("finished", "walk")
	return .update(delta)
