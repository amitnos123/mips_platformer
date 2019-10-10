extends "res://Player/States/Motion/In Air/in_air.gd"

func enter():
	owner.get_node("AnimatedSprite").play("fall")
	.enter()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	velocity.y = 0
	.update(delta)