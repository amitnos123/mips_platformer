extends Area2D

class_name Interactable

signal interacted

onready var mouse_in_area = false

# Trigger the input wasn't handled by anything and left for collsion to handle
# @param {Object} viewport - 
# @param {InputEvent} event - The input event object
# @param {int} shape_idx - 
# @returns {void}
func _input_event(viewport, event, shape_idx):
	if mouse_in_area:
		if event is InputEventMouseButton:
			if event.pressed && event.button_index == BUTTON_LEFT :
				interacte(viewport, event, shape_idx)

# Trigger when mouse enters the interactable area
# @returns {void}
func _on_Interactable_mouse_entered():
	mouse_in_area = true
	
# Trigger when mouse exist the interactable area
# @returns {void}
func _on_Interactable_mouse_exited():
	mouse_in_area = false

# Trigger when interacting
# Intened to be changed by inherit classes and objects
# @returns {void}
func interacte(viewport, event, shape_idx):
	emit_signal("interacted")
