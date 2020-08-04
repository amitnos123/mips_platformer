tool
extends "res://GUI/Window/window.gd"

signal mouse_change_window(window_node)
signal item_drop(item_drop_node)

export(Color) var DEFAULT_COLOR : Color = Color.darkviolet
export(Color) var SELECT_COLOR : Color = Color.forestgreen

export(int) var COLUMNS : int = 4
export(int) var ROWS : int = 4

export(Vector2) var SCROLLBAR_MIN_RECT_SIZE : Vector2 = Vector2(15,0)

export(PackedScene) var ITEM_CONTAINER : PackedScene = preload('res://GUI/Window/Inventory/item_container.tscn')

onready var item_inventory_test = preload('res://Items/Item Test/Item Inventory Test/item_inventory_test.tscn')
onready var mouse_in_window = null

func _ready():
	$WindowContainer/WindowBackground/InventoryScrollContainer.get_v_scrollbar().rect_min_size = SCROLLBAR_MIN_RECT_SIZE
	
	for index in range(COLUMNS * ROWS):
		var itemContainerNode = ITEM_CONTAINER.instance()
		itemContainerNode.defaultColor = DEFAULT_COLOR
		itemContainerNode.selectColor = SELECT_COLOR
		itemContainerNode.container_id = index
		
		itemContainerNode.connect('_on_select', self, '_on_item_container_select')
		itemContainerNode.connect('_on_unselect', self, '_on_item_container_unselect')
		itemContainerNode.connect('_on_dragged', self, '_on_item_container_dragged')
		itemContainerNode.connect('_on_stop_drag', self, '_on_item_container_stop_drag')
		
		connect('mouse_change_window', itemContainerNode, '_on_mouse_change_window')
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.add_child(itemContainerNode)

func add_item(item_data : Item):
#	if item_data is ItemQuantity:
#	else:
	for itemContainerNode in $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_children():
		if itemContainerNode.item_data == null:
			itemContainerNode.item_data = item_data
			break

func remove_item(container_id):
	pass

func _on_ScrollContainer_gui_input(event):
	.drag_window(event)

func _on_item_container_select(container_id):
	if not $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).item_data:
		var itemInventoryTestNode = item_inventory_test.instance()
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).item_data = itemInventoryTestNode.item_data

func _on_item_container_unselect(container_id):
	pass
#	print(selectedItemsDictionary[container_id].selected)
#	print('unselect container_id=', container_id)
#	var deleteNode = $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).get_child(0)
#	$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).remove_child(deleteNode)

func is_full():
	pass
#	for container in selectedItemsDictionary:
#		if selectedItemsDictionary[container].item_data == null:
#			return false
#	return true

func can_add_item(item_data : Item):
#	if item_data is ItemQuantity:
#	else:
	for itemContainerNode in $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_children():
		if itemContainerNode.item_data == null:
			return true
	return false
	
func _on_mouse_change_window(window_node):
	mouse_in_window = window_node
	emit_signal('mouse_change_window', window_node)

func _on_item_container_dragged(container_id):
	pass

func _on_item_container_stop_drag(container_id):
	if(mouse_in_window == null): # Drop item
		var drop_item_node = $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).get_child(0).item_data.drop_scene.instance()
		emit_signal("item_drop", drop_item_node)
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).remove_item()
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).selected = false
