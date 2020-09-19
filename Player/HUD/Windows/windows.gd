extends Control

signal mouse_change_window(window_node)

# The node which the mouse is on
onready var mouse_on_window = null
onready var windows_array = []

onready var current_tooltip = null

func _ready():
	var mouse_pos = get_global_mouse_position()
	for window in get_children():
		window.connect('move_to_top', self, '_on_move_window_to_top')
		connect('mouse_change_window', window, '_on_mouse_change_window')
		windows_array.push_back(window)

func _input(event):
	
	if current_tooltip:
		current_tooltip.queue_free()
	
	if event is InputEventMouseMotion:
		
		var in_window = false
		for window in windows_array:
			if window.visible:
				if(window.get_rect().has_point(event.position)):
					in_window = true
					if(mouse_on_window != window):
						mouse_on_window = window
						emit_signal('mouse_change_window', mouse_on_window)
		if not in_window && mouse_on_window != null:
			mouse_on_window = null
			emit_signal('mouse_change_window', mouse_on_window)

# Place a window on the top
# @param {Window} window - The window node
# @returns {void}
func _on_move_window_to_top(window : Window):
	move_child(window, get_child_count() - 1)

# Add a window for the player and place it on the top
# @param {Window} window - The window node which will be added
# @returns {void}
func add_window(window : Window) -> void:
	window.connect('move_to_top', self, '_on_move_window_to_top')
	connect('mouse_change_window', window, '_on_mouse_change_window')
	
	if window is WindowInventory:
		window.connect('item_drop', owner, '_on_window_inventory_item_drop')
	
	windows_array.push_back(window)
	add_child(window)

func _on_show_tooltip(item_tooltip_node):
	current_tooltip = item_tooltip_node
	
	item_tooltip_node.visible = true
	item_tooltip_node.rect_position = get_viewport().get_mouse_position()
	
	add_child(item_tooltip_node)
