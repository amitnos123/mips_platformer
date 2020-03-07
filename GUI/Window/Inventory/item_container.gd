extends PanelContainer

signal _on_select
signal _on_unselect

export(Color) var defaultColor : Color = Color.white
export(Color) var selectColor : Color = Color.black

onready var selected = false setget set_selected, is_selected
onready var itemData setget set_itemData, get_itemData

var container_id

func _ready():
	self.set_self_modulate(defaultColor)
	# warning-ignore:return_value_discarded
	self.connect('gui_input', self, '_on_pressed')

func _on_pressed(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.doubleclick:
			print('doubleclick')
			self.selected = false
		elif event.pressed:
			if selected:
				unselect()
			else:
				select()

func set_selected(value):
	if value != selected:
		if value:
			select()
		else:
			unselect()

func is_selected():
	return selected

func select():
	selected = true
	self.self_modulate = selectColor
	emit_signal('_on_select', container_id)

func unselect():
	selected = false
	self.self_modulate = defaultColor
	emit_signal('_on_unselect', container_id)

func set_itemData(value):
	print('set_itemData Container')
	get_child(0).itemData = value
	
func get_itemData():
	return get_child(0).itemData

func _on_ItemInventory_dragged():
	print('_on_ItemInventory_dragged')
	print(selected)
	print(self.self_modulate)
	selected = !selected
	print(selected)
	print(self.self_modulate)
