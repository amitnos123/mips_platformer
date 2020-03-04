extends Node

export(int) var code
export(int) var generated_code
export(String) var itemName : String
export(PackedScene) var dropScene : PackedScene = load('res://Items/Item Test/Item Drop Test/ItemDropTest.tscn')
export(PackedScene) var inventoryScene : PackedScene = load('res://Items/Item Test/Item Inventory Test/ItemInventoryTest.tscn')

var itemData : Item

func _init():
	print('ABC')
	itemData = Item.new(code, generated_code, itemName, dropScene, inventoryScene)

func get_item_drop_node():
	var dropNode = dropScene.instance()
	dropNode.itemData = self.itemData
	return dropNode

func get_item_inventory_node():
	var inventoryNode = inventoryScene.instance()
	inventoryNode.itemData = self.itemData
	return inventoryNode
