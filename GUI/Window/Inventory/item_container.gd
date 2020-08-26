extends PanelContainer

class_name ItemContainer

signal _on_select
signal _on_unselect
signal _on_dragged(container_id)
signal _on_stop_drag(container_id)

export(Color) var defaultColor : Color = Color.white
export(Color) var selectColor : Color = Color.black

onready var selected = false setget set_selected, is_selected
onready var item_data setget set_item_data, get_item_data
onready var ITEM_INVENTORY_NODEPATH = $ItemInventory

var container_id = null
var is_preview_event_press = false

func _ready():
	self.set_self_modulate(defaultColor)
	self.connect('gui_input', self, '_on_pressed')

func _on_pressed(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.doubleclick:
			print('doubleclick')
		elif event.pressed:
			is_preview_event_press = true
		elif is_preview_event_press:
			self.selected = !selected

# Trigger on starting to drag the item
# @returns {void}
func _on_item_inventory_dragged(container_id):
	emit_signal("_on_dragged",container_id)

# Trigger on finish to drag the item
# @returns {void}
func _on_item_inventory_stop_drag(container_id):
	emit_signal("_on_stop_drag",container_id)

func set_selected(value):
	if value != selected:
		if value:
			select()
		else:
			unselect()

func set_item_data(value):
	ITEM_INVENTORY_NODEPATH.item_data = value
	
func get_item_data():
	return ITEM_INVENTORY_NODEPATH.item_data

func is_selected() -> bool:
	return selected

# Selecting the item container
# @returns {void}
func select() -> void:
	selected = true
	self.self_modulate = selectColor
	emit_signal('_on_select', container_id)

# Unselecting the item container
# @returns {void}
func unselect() -> void:
	selected = false
	self.self_modulate = defaultColor
	emit_signal('_on_unselect', container_id)

# Removes the item
# @returns {void}
func remove_item() -> void:
	ITEM_INVENTORY_NODEPATH.remove_item()
