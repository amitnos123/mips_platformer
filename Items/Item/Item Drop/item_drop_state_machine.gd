extends "res://State Machine/state_machine.gd"

func _ready():
	states_map = {
		"drop": $Drop,
		"picked": $Picked,
		"despawn": $Despawn,
	}

func _change_state(state_name):
	if state_name == "picked" || state_name == "despawn":
		states_stack.clear()
		set_active(false)
	._change_state(state_name)

func _physics_process(delta):
	._physics_process(delta)

func _input(event):
	current_state.handle_input(event)