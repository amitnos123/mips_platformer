extends KinematicBody2D

class_name Player

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction

export(Vector2) var LIE_DOWN_POSITION = Vector2.DOWN * 2
export(Vector2) var CRAWL_POSITION = Vector2.DOWN * 5

func _unhandled_input(event):
	if event.is_action_pressed("toggle_window_player_inventory"):
		if $Camera2D/HUD/Windows/WindowInventory.is_visible():
			$Camera2D/HUD/Windows/WindowInventory.set_visible(false)
		else:
			$Camera2D/HUD/Windows/WindowInventory.set_visible(true)
	
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

func is_inventory_full():
	return $Camera2D/HUD/Windows/WindowInventory.is_inventory_full()

func add_item(itemData : Item):
	print('is_item_null ', itemData == null)
	print('is_inventory_full ', $Camera2D/HUD/Windows/WindowInventory.is_inventory_full())
