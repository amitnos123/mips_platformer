extends Area2D

signal interacted

onready var mouse_in_area = false

func _on_Interactable_input_event(viewport, event, shape_idx):
	if mouse_in_area:
		if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
			if event.pressed:
				interacte(viewport, event, shape_idx)

func _on_Interactable_mouse_entered():
	mouse_in_area = true

func _on_Interactable_mouse_exited():
	mouse_in_area = false

func interacte(viewport, event, shape_idx):
	emit_signal("interacted")
