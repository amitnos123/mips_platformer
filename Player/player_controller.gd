extends KinematicBody2D

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)
	if value == Vector2.RIGHT:
		$AnimatedSprite.flip_h = false
	elif value == Vector2.LEFT:
		$AnimatedSprite.flip_h = true
