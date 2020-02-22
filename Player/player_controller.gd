extends KinematicBody2D

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)
	if value.x == Vector2.RIGHT.x:
		$AnimatedSprite.flip_h = false
	elif value.x == Vector2.LEFT.x:
		$AnimatedSprite.flip_h = true

func _on_lie_down():
	$CollisionBox.disabled = true
	$CollisionBoxLieDown.disabled = false
	$CollisionBoxCrawl.disabled = true
	move_and_collide(Vector2.DOWN * 8) # Moving the body, because the collsion box size changed
	return

func _on_crawl():
	$CollisionBox.disabled = true
	$CollisionBoxLieDown.disabled = true
	$CollisionBoxCrawl.disabled = false
	move_and_collide(Vector2.DOWN * 20) # Moving the body, because the collsion box size changed
	return

func _on_stop_lying_down():
	move_and_collide(Vector2.UP * 8) # Moving the body, because the collsion box size changed
	$CollisionBox.disabled = false
	$CollisionBoxLieDown.disabled = true
	$CollisionBoxCrawl.disabled = true
	return
