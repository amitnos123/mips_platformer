extends "res://Player/States/Motion/On Ground/Standing/standing.gd"

export(float) var MAX_RUN_SPEED = 150

func enter():
	owner.get_node("AnimatedSprite").play("run")
	.enter()

func handle_input(event):
	if event.is_action_released("move_run"):
		emit_signal("finished", "walk")
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if not input_direction.x:
		emit_signal("finished", "idle")
	update_look_direction(input_direction)
	velocity = input_direction * MAX_RUN_SPEED
	.update(delta)
