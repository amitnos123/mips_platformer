#extends "res://State Machine/state.gd"
extends State

#export(NodePath) var STATE_COLLISION_BOX

# Initialize the state. E.g. change the animation
func enter():
	#get_node(STATE_COLLISION_BOX).set_process(true)
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	#get_node(STATE_COLLISION_BOX).set_process(false)
	return
