extends Node

signal state_changed(current_state)

const PREVIEW_STATE = 'preview'

export(NodePath) var START_STATE
var states_map = {}

var states_stack = []
var current_state = null
var _active = false setget set_active

func _ready():
	if not START_STATE:
		START_STATE = get_child(0).get_path()
#		If there isn't any starting state, then take the first state in the list
	for child in get_children():
		child.connect("finished", self, "_change_state")
#		Connect the signal 'finished' to the function _change_state
	initialize(START_STATE)

func initialize(start_state):
#	Initialize the state machine by the starting state
	if not states_stack.empty():
		states_stack.clear()
	set_active(true)
	states_stack.push_front(get_node(start_state))
	current_state = states_stack[0]
	current_state.enter()

func _change_state(state_name):
	if not _active:
		return
	
#	Call function when exiting the state
	current_state.exit()
	
#		If not active, then don't run
	if state_name == PREVIEW_STATE:
		states_stack.pop_front()
		current_state = states_stack.pop_front()
#		Remove the 2 last states in the stack and later will return the current_state to the stack, that why will only removed the last one
	else :
		current_state = states_map[state_name]
	
	emit_signal("state_changed", current_state)
	states_stack.push_front(current_state)
	current_state.enter()

func set_active(value):
#	Turn on and off the machine state
	_active = value
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		states_stack = []
		current_state = null

#START - State Run
func _input(event):
	current_state.handle_input(event)

func _physics_process(delta):
	current_state.update(delta)

func _on_animation_finished(anim_name):
	if not _active:
		return
	current_state._on_animation_finished(anim_name)
#End - State Run