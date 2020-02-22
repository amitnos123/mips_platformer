extends "res://Player/States/Motion/On Ground/Lying/lying.gd"

signal lying_down

# Initialize the state. E.g. change the animation
func enter():
	velocity = Vector2()
	owner.get_node("AnimatedSprite").play("lie_down")
	emit_signal("lying_down")
	return

func exit():
	return .exit()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if input_direction.x:
		emit_signal("finished", "crawl")
	if not input_direction.y:
		emit_signal("finished", "idle")
	return .update(delta)
