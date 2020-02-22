extends "res://Player/States/Motion/On Ground/on_ground.gd"

func enter():
	.enter()

func exit():
	return .exit()

func handle_input(event):
	if event.is_action_pressed("lie_down"):
		emit_signal("finished", "lie_down")
	return .handle_input(event)

func update(delta):
	return .update(delta)
