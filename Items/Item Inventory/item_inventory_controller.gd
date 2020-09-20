extends TextureRect

class_name ItemInventory

const EMPTY_ITEM_INVENTORY = 'res://Items/Item Inventory/item_inventory.tscn'

signal _on_dragged(container_id)
signal _on_stop_drag(container_id)
signal _on_show_tooltip(item_tooltip_node)

export(float) var TIMER_WAIT_TIME = 1

var is_mouse_over_item = false
var item_data : Item = null setget set_item_data, get_item_data
onready var is_mouse_over_window = false
onready var is_dragged = false
onready var EMPTY_ITEM_INVENTORY_PACKED_SCERNE = load(EMPTY_ITEM_INVENTORY)
onready var TIMER_TOOLTIP = $TimerTooltip

func _ready():
	connect('_on_dragged', get_parent(), '_on_item_inventory_dragged')
	connect('_on_stop_drag', get_parent(), '_on_item_inventory_stop_drag')
	connect('_on_show_tooltip', get_parent(), '_on_show_tooltip')

func _gui_input(event):
	if is_mouse_over_item && event is InputEventMouseMotion:
		TIMER_TOOLTIP.start(TIMER_WAIT_TIME)
	
	if event is InputEventMouseButton:
		if Input.is_action_just_released("mouse1") && is_dragged:
			is_dragged = false
			emit_signal("_on_stop_drag", get_parent().container_id)

func set_item_data(value) -> void:
	item_data = value
	var inventoryScene = value.inventory_scene.instance()
	replace_by(inventoryScene, true)

func get_item_data() -> Item:
	return item_data

# Called when start dragging the item
# @param {Vector2} _pos - The postions of the drag in local coordinates
# @returns {Node} - The data which will be sent when dragged
func get_drag_data(_pos) -> Node:
	if item_data == null:
		return null
	
	emit_signal("_on_dragged", get_parent().container_id)
	is_dragged = true
	
	var tr = TextureRect.new()
	tr.texture = self.texture
	tr.rect_size = self.rect_size
	tr.expand = true
	set_drag_preview(tr)
	
	return get_parent()

# Checks when can drop
# @param {Vector2} _pos - The postions of the drag in local coordinates
# @returns {bool} - If allowed to drop
func can_drop_data(_pos, data) -> bool:
	return (data is ItemContainer)

# Called when dropping the item
# @param {Vector2} _pos - The postions of the drag in local coordinates
# @param {item_container} _pos - The item container which was dragged
# @returns {void}
func drop_data(_pos, item_container) -> void:
	
	var item_inventory = item_container.get_child(0)
	
	var item_inventory_duplicate = item_inventory.item_data.inventory_scene.instance()
	self.get_parent().selected = false
	item_container.selected = false
	
	if item_data:
		item_inventory.replace_by(item_data.inventory_scene.instance())
	else:
#		item_inventory.replace_by(load(EMPTY_ITEM_INVENTORY).instance())
		item_inventory.replace_by(EMPTY_ITEM_INVENTORY_PACKED_SCERNE.instance())
		
	if item_inventory.item_data:
		replace_by(item_inventory_duplicate.item_data.inventory_scene.instance())
	else:
#		replace_by(load(EMPTY_ITEM_INVENTORY).instance())
		replace_by(EMPTY_ITEM_INVENTORY_PACKED_SCERNE.instance())

# Removes the item
# @returns {void}
func remove_item() -> void:
#	var emptyItemInventory = load(EMPTY_ITEM_INVENTORY)
#	replace_by(emptyItemInventory.instance(), false)
	replace_by(EMPTY_ITEM_INVENTORY_PACKED_SCERNE.instance(), false)

func _on_mouse_entered():
	is_mouse_over_item = true
	TIMER_TOOLTIP.start(TIMER_WAIT_TIME)

func _on_mouse_exited():
	is_mouse_over_item = false
	TIMER_TOOLTIP.stop()

func _on_timer_tooltip_timeout():
	TIMER_TOOLTIP.stop()
	
	emit_signal('_on_show_tooltip', item_data.tooltip_scene.instance())
