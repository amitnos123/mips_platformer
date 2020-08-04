extends "res://Items/Item Drop/item_drop_controller.gd"

export(int) var code
export(int) var generated_code
export(String) var itemName : String
export(PackedScene) var dropScene : PackedScene = load('res://Items/Item Test/Item Drop Test/ItemDropTest.tscn')
export(PackedScene) var inventoryScene : PackedScene = load('res://Items/Item Test/Item Inventory Test/ItemInventoryTest.tscn')

func _init():
	itemData = Item.new(code, generated_code, itemName, dropScene, inventoryScene)
