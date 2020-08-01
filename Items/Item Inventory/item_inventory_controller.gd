extends TextureRect

signal dragged

var itemData : Item = null setget set_itemData, get_itemData

func _ready():
	connect('dragged', get_parent(), "_on_ItemInventory_dragged")

func get_drag_data(_pos):
	if itemData == null:
		return null
	
	emit_signal("dragged")
	
	var tr = TextureRect.new()
	tr.texture = self.texture
	tr.rect_size = self.rect_size
	tr.expand = true
	set_drag_preview(tr)
	
	return get_parent()

func can_drop_data(_pos, data):
	#return (data is Item)
	return (data is ItemContainer)

func drop_data(_pos, item_container):
	var item_inventory = item_container.get_child(0)
	var item_inventory_duplicate = item_inventory.duplicate()
	
	self.get_parent().selected = false
	item_container.selected = false
	
	item_inventory.replace_by(self.duplicate())
	replace_by(item_inventory_duplicate)

func set_itemData(value):
	itemData = value
	var inventoryScene = value.inventory_scene.instance()
#	inventoryScene.connect()
	replace_by(inventoryScene, true)

func get_itemData():
	return itemData

