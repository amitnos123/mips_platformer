extends "res://State Machine/state.gd"

export(float) var DESPAWN_TIME = 60

var player_in_pick_area : bool = false

# Initialize the state. E.g. change the animation
func enter():
	$DespawnTimer.start(DESPAWN_TIME)
	owner.get_node("Animation").play("drop")
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return

func handle_input(event):
	if player_in_pick_area:
		if event.is_action_pressed("item_pick"):
			emit_signal("finished", "picked")
	return

func _on_DespawnTimer_timeout():
	emit_signal("finished", "despawn")

func _on_animation_finished():
	pass

func _on_body_entered(body):
	if body.name == Constants.PLAYER_NODE_NAME:
		player_in_pick_area = true

func _on_body_exited(body):
	if body.name == Constants.PLAYER_NODE_NAME:
		player_in_pick_area = false
