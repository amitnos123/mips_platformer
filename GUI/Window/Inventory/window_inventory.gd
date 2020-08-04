tool
extends "res://GUI/Window/window.gd"

signal mouse_change_window(window_node)
signal _on_item_drop(item_drop_node)

export(Color) var defaultColor : Color = Color.darkviolet
export(Color) var selectColor : Color = Color.forestgreen

export(int) var columns : int = 4
export(int) var rows : int = 4

export(PackedScene) var itemContainer : PackedScene = preload('res://GUI/Window/Inventory/item_container.tscn')

onready var itemInventoryTest = preload('res://Items/Item Test/Item Inventory Test/ItemInventoryTest.tscn')
onready var mouse_in_window = null

func _ready():
	for index in range(columns * rows):
		var itemContainerNode = itemContainer.instance()
		itemContainerNode.defaultColor = defaultColor
		itemContainerNode.selectColor = selectColor
		itemContainerNode.container_id = index
		
		itemContainerNode.connect('_on_select', self, '_on_itemContainer_select')
		itemContainerNode.connect('_on_unselect', self, '_on_itemContainer_unselect')
		itemContainerNode.connect('_on_dragged', self, '_on_itemContainer_dragged')
		itemContainerNode.connect('_on_stop_drag', self, '_on_itemContainer_stop_drag')
		
		connect('mouse_change_window', itemContainerNode, '_on_mouse_change_window')
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.add_child(itemContainerNode)

func add_item(itemData : Item):
#	if itemData is ItemQuantity:
#	else:
	for itemContainerNode in $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_children():
		if itemContainerNode.itemData == null:
			itemContainerNode.itemData = itemData
			break

func remove_item(container_id):
	pass

func _on_ScrollContainer_gui_input(event):
	.drag_window(event)

func _on_itemContainer_select(container_id):
	if not $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).itemData:
		var itemInventoryTestNode = itemInventoryTest.instance()
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).itemData = itemInventoryTestNode.itemData

func _on_itemContainer_unselect(container_id):
	pass
#	print(selectedItemsDictionary[container_id].selected)
#	print('unselect container_id=', container_id)
#	var deleteNode = $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).get_child(0)
#	$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).remove_child(deleteNode)

func is_full():
	pass
#	for container in selectedItemsDictionary:
#		if selectedItemsDictionary[container].itemData == null:
#			return false
#	return true

func can_add_item(itemData : Item):
#	if itemData is ItemQuantity:
#	else:
	for itemContainerNode in $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_children():
		if itemContainerNode.itemData == null:
			return true
	return false
	
func _on_mouse_change_window(window_node):
	mouse_in_window = window_node
	emit_signal('mouse_change_window', window_node)

func _on_itemContainer_dragged(container_id):
	pass

func _on_itemContainer_stop_drag(container_id):
	if(mouse_in_window == null): # Drop item
		var drop_item_node = $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).get_child(0).itemData.drop_scene.instance()
		emit_signal("_on_item_drop", drop_item_node)
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).remove_item()
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).selected = false
