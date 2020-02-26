extends KinematicBody2D

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction

export(Vector2) var LIE_DOWN_POSITION = Vector2.DOWN * 2
export(Vector2) var CRAWL_POSITION = Vector2.DOWN * 5

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)
	if value.x == Vector2.RIGHT.x:
		$AnimatedSprite.flip_h = false
	elif value.x == Vector2.LEFT.x:
		$AnimatedSprite.flip_h = true

func _on_lie_down():
	$CollisionBoxLieDown.disabled = false
	$CollisionBox.disabled = true
	$CollisionBoxCrawl.disabled = true
	
	$AnimatedSprite.set_position(LIE_DOWN_POSITION) 
	return

func _on_crawl():
	$CollisionBoxCrawl.disabled = false 
	$CollisionBox.disabled = true
	$CollisionBoxLieDown.disabled = true
	
	$AnimatedSprite.set_position(CRAWL_POSITION)
	return

func _on_stop_lying_down():
	$CollisionBox.disabled = false
	$CollisionBoxLieDown.disabled = true
	$CollisionBoxCrawl.disabled = true
	
	$AnimatedSprite.set_position(Vector2.ZERO) 
	return
