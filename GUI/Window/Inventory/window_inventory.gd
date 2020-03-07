tool
extends "res://GUI/Window/window.gd"

export(Color) var defaultColor : Color = Color.darkviolet
export(Color) var selectColor : Color = Color.forestgreen

export(int) var columns : int = 4
export(int) var rows : int = 4

export(PackedScene) var itemContainer : PackedScene = preload('res://GUI/Window/Inventory/item_container.tscn')

onready var selectedItemsDictionary = {}
onready var itemInventoryTest = preload('res://Items/Item Test/Item Inventory Test/ItemInventoryTest.tscn')

func _ready():
	for index in range(columns * rows):
		var itemContainerNode = itemContainer.instance()
		itemContainerNode.defaultColor = defaultColor
		itemContainerNode.selectColor = selectColor
		itemContainerNode.container_id = index
		itemContainerNode.connect('_on_select', self, '_on_itemContainer_select')
		itemContainerNode.connect('_on_unselect', self, '_on_itemContainer_unselect')
		selectedItemsDictionary[index] = itemContainerNode
		$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.add_child(itemContainerNode)

func add_item():
	pass

func remove_item(container_id):
	pass

func _on_ScrollContainer_gui_input(event):
	.drag_window(event)

func _on_itemContainer_select(container_id):
	var itemInventoryTestNode = itemInventoryTest.instance()
	$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).itemData = itemInventoryTestNode.itemData

func _on_itemContainer_unselect(container_id):
	pass
#	print(selectedItemsDictionary[container_id].selected)
#	print('unselect container_id=', container_id)
#	var deleteNode = $WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).get_child(0)
#	$WindowContainer/WindowBackground/InventoryScrollContainer/ItemsGridContainer.get_child(container_id).remove_child(deleteNode)

func is_inventory_full():
	for container in selectedItemsDictionary:
		if selectedItemsDictionary[container].itemData == null:
			return false
	return true
