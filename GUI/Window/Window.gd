tool
extends Control

class_name Window

signal move_to_top

export var DEFAULT_LABEL_TEXT = 'label'

onready var label_text setget set_label, get_label
onready var label_node_path = $WindowContainer/WindowBackground/Label
onready var drag_position : Vector2 = Vector2.ZERO

func _ready():
	self.label_text = DEFAULT_LABEL_TEXT

func set_label(value):
	label_node_path.text = value

func get_label():
	return label_node_path.text

func _on_close_button_pressed():
	self.set_visible(false)

func _on_click_label_alert_gui_input(event):
	drag_window(event)

func _on_window_container_gui_input(event):
	drag_window(event)

func _on_window_background_gui_input(event):
	drag_window(event)

func drag_window(event):
	if event is InputEventMouseButton:
		if event.pressed:
			drag_position = get_local_mouse_position()
			emit_signal('move_to_top', self)
		else:
			drag_position = Vector2.ZERO
			
	if event is InputEventMouse and drag_position.length() != 0:
		rect_global_position += get_local_mouse_position() - drag_position
