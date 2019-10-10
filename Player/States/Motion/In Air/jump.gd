extends "res://Player/States/Motion/In Air/in_air.gd"

export(float) var AIR_TIME = 1
export(float) var JUMP_SPEED = 100

func enter():
	$JumpDuration.start(AIR_TIME)
	owner.get_node("AnimatedSprite").play("jump")
	.enter()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	velocity.y = (GRAVITY_SPEED + JUMP_SPEED) * Vector2.UP.y #GRAVITY_SPEED because, in motion at update will insert the gravity, that way will ignore the gravity
	.update(delta)

func exit():
	if not $JumpDuration.is_stopped():
		$JumpDuration.stop()
	return .exit()

func _on_JumpDuration_timeout():
	emit_signal("finished", "preview")
