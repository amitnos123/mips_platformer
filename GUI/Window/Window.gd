extends Control

signal move_to_top

var drag_position = null

func _ready():
	pass

func _on_CloseButton_pressed():
	self.set_visible(false)

func drag_window(event): #_on_gui_input
	if event is InputEventMouseButton:
		if event.pressed:
			drag_position = get_global_mouse_position() - rect_global_position
			emit_signal('move_to_top', self)
		else:
			drag_position = null

	if event is InputEventMouse and drag_position:
		rect_global_position = get_global_mouse_position() - drag_position
