extends Node2D

var itemScript = load('res://Items/Item Test/item_test.gd')
var instance = itemScript.new()

func _ready():
	var dropItem = instance.get_item_drop_node()
	dropItem.set_position(Vector2(165, 279))
	add_child(dropItem)

func _on_item_drop(item_drop_node, position : Vector2):
	item_drop_node.position = position
	add_child(item_drop_node)
