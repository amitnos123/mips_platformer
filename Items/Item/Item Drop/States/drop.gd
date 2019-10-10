extends "res://State Machine/state.gd"

export(float) var DESPAWN_TIME = 60

# Initialize the state. E.g. change the animation
func enter():
	$DespawnTimer.start(DESPAWN_TIME)
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return

func handle_input(event):
	if owner.player_in_pick_area:
		if event.is_action_pressed("item_pick"):
			emit_signal("finished", "picked")
	return

func update(delta):
	return

func _on_animation_finished(anim_name):
	return

func _on_DespawnTimer_timeout():
	emit_signal("finished", "despawn")
