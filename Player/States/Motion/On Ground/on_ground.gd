extends "res://Player/States/Motion/motion.gd"

func enter():
	.enter()

func handle_input(event):
	if event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
	return .handle_input(event)

func update(delta):
	velocity.y = 0
	.update(delta)
	if not owner.is_on_floor():
		emit_signal("finished", "fall")
	return 