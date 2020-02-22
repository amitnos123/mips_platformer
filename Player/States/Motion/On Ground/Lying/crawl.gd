extends "res://Player/States/Motion/On Ground/Lying/lying.gd"

signal crawling

export(float) var MAX_CRAWL_SPEED = 30

# Initialize the state. E.g. change the animation
func enter():
	velocity = Vector2()
	owner.get_node("AnimatedSprite").play("crawl")
	emit_signal("crawling")
	return

func exit():
	return .exit()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if not input_direction.x:
		emit_signal("finished", "lie_down")
	update_look_direction(input_direction)
	velocity = input_direction * MAX_CRAWL_SPEED
	.update(delta)
	return .update(delta)
