extends "res://Player/States/Motion/On Ground/Standing/standing.gd"

export(float) var MAX_WALK_SPEED = 100

func enter():
	owner.get_node("AnimatedSprite").play("walk")
	.enter()

func handle_input(event):
	if event.is_action_pressed("move_run"):
		emit_signal("finished", "run")
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if not input_direction.x:
		emit_signal("finished", "idle")
	update_look_direction(input_direction)
	velocity = input_direction * MAX_WALK_SPEED
	.update(delta)
