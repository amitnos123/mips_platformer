extends KinematicBody2D

class_name Player

signal direction_changed(new_direction)
signal item_drop(item_drop_node)

var look_direction = Vector2(1, 0) setget set_look_direction

onready var inventory_node_path = $Camera2D/HUD/Windows/PlayerInventory
onready var windows_node_path = $Camera2D/HUD/Windows

export(Vector2) var LIE_DOWN_POSITION = Vector2.DOWN * 2
export(Vector2) var CRAWL_POSITION = Vector2.DOWN * 5

# Triggers when catches an unhandled input
# @param {InputEvent} event - The client's input
func _unhandled_input(event):
	if event.is_action_pressed("toggle_window_player_inventory"):
		if inventory_node_path.is_visible():
			inventory_node_path.set_visible(false)
		else:
			inventory_node_path.set_visible(true)

# Set the look direction of the player
# @param {Vector2} value - Vector2 of the direction which the player will look
# @returns {void}
func set_look_direction(value : Vector2):
	look_direction = value
	emit_signal("direction_changed", value)
	if value.x == Vector2.RIGHT.x:
		$AnimatedSprite.flip_h = false
	elif value.x == Vector2.LEFT.x:
		$AnimatedSprite.flip_h = true
		
# Return if the player's inventory is full
# @returns {bool} - If the player's inventory is full
func is_inventory_full():
	return inventory_node_path.is_full()

# Return if the item can be added to the player's inventory or not
# @param {Item} item_data - The item to check if can be added
# @returns {bool} - item can be added or not
func can_add_item(item_data : Item):
	return inventory_node_path.can_add_item(item_data)

# Add an item to the player's inventory
# @param {Item} item_data - The item to add
func add_item(item_data : Item):
	inventory_node_path.add_item(item_data)
	
# Add a window
# @param {Window} window_node - The window's node which will be added
func add_window(window_node : Window):
	if window_node.get_parent():
		window_node.get_parent().remove_child(window_node)
	windows_node_path.add_window(window_node)

# Triggers on when starting to lie down
func _on_lie_down():
	$CollisionBoxLieDown.disabled = false
	$CollisionBox.disabled = true
	$CollisionBoxCrawl.disabled = true
	
	$AnimatedSprite.set_position(LIE_DOWN_POSITION) 
	
# Triggers on when starting to crawling
func _on_crawl():
	$CollisionBoxCrawl.disabled = false
	$CollisionBox.disabled = true
	$CollisionBoxLieDown.disabled = true
	
	$AnimatedSprite.set_position(CRAWL_POSITION)

# Triggers on when getting up (not crawling or lying down)
func _on_stop_lying_down():
	$CollisionBox.disabled = false
	$CollisionBoxLieDown.disabled = true
	$CollisionBoxCrawl.disabled = true
	$AnimatedSprite.set_position(Vector2.ZERO) 

# Triggers on dropping an item from the inventory
# @param {Node2D} item_drop_node - The item's drop node which is dropped from the inventory
func _on_window_inventory_item_drop(item_drop_node):
	drop_item(item_drop_node)
	
# General function for dropping items
# @param {Node2D} item_drop_node - The item's drop node which is dropped
# @param {Vector2} position - The position which the item will be dropped at
func drop_item(item_drop_node, position : Vector2 = self.position): 
	emit_signal('item_drop', item_drop_node, position)
