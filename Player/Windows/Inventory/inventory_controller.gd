extends "res://GUI/Window/Window.gd"

onready var mouse_in_item_list : bool = false

func _ready():
	var icon = ResourceLoader.load("res://icon.png")
	for i in range(0,20):
		$WindowContainer/WindowBackground/ItemList.add_item("", icon, true)

func drag_window(event): #_on_gui_input
	if not mouse_in_item_list or $WindowContainer/WindowBackground/ItemList.get_item_at_position(get_local_mouse_position(), true) == -1:
		.drag_window(event)
	else:
		drag_position = Vector2.ZERO

func _on_ItemList_nothing_selected():
	$WindowContainer/WindowBackground/ItemList.unselect_all()

func _on_ItemList_gui_input(event):
	drag_window(event)

func _on_ItemList_mouse_entered():
	mouse_in_item_list = true

func _on_ItemList_mouse_exited():
	mouse_in_item_list = false
