extends WindowInventory

class_name InteractableWindowInventory

onready var original_owner = get_owner()

func _on_close_button_pressed():
	get_parent().connect('mouse_change_window', self, '_on_mouse_change_window')
	get_parent().remove_child(self)
	original_owner.add_child(self)
	._on_close_button_pressed()
	unselect_all()
