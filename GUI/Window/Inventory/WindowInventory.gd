extends "res://GUI/Window/Window.gd"

func _ready():
	pass


func _on_ScrollContainer_gui_input(event):
	.drag_window(event)
