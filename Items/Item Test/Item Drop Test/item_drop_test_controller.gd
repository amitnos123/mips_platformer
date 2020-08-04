extends "res://Items/Item Drop/item_drop_controller.gd"

export(int) var CODE
export(int) var GENERATED_CODE
export(String) var ITEM_NAME : String
export(PackedScene) var DROP_SCENE : PackedScene = load('res://Items/Item Test/Item Drop Test/item_drop_test.tscn')
export(PackedScene) var INVENTORY_SCENE : PackedScene = load('res://Items/Item Test/Item Inventory Test/item_inventory_test.tscn')

func _init():
	item_data = Item.new(CODE, GENERATED_CODE, ITEM_NAME, DROP_SCENE, INVENTORY_SCENE)
