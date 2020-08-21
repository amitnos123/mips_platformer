extends Node2D

func _ready():
	var item_script = load('res://Items/Item Test/item_test.gd')
	var instance = item_script.new()
	
	var dropItem = instance.get_item_drop_node()
	dropItem.set_position(Vector2(165, 279))
	add_child(dropItem)
	print(Vector2.ZERO + Vector2.RIGHT + Vector2.UP)
	print(Vector2.ZERO + Vector2.LEFT + Vector2.DOWN)

# Trigger when dropping item on the ground
# @param {Node2D} item_drop_node - The item's drop node which is dropped
# @param {Vector2} position - The position which the item will be dropped at
func _on_item_drop(item_drop_node, position : Vector2):
	item_drop_node.position = position
	add_child(item_drop_node)
