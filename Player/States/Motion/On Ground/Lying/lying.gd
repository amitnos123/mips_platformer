extends "res://Player/States/Motion/On Ground/on_ground.gd"

signal stop_lying_down

func enter():
	.enter()

func exit():
	emit_signal("stop_lying_down")
	return .exit()

func handle_input(event):
	if event.is_action_released("lie_down"):
		emit_signal("finished", "idle")
	return .handle_input(event)

func update(delta):
	return .update(delta)
