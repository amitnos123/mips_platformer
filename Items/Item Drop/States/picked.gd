extends "res://State Machine/state.gd"

func enter():
	owner.get_node("Animation").play("picked")
	owner.emit_signal('picked', owner.itemData)
	return

func _on_animation_finished():
	owner.queue_free()
	return
