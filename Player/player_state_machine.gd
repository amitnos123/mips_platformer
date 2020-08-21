extends StateMachine

func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"run": $Run,
		"fall": $Fall,
		"jump": $Jump,
		"lie_down": $LieDown,
		"crawl": $Crawl,
	}

func _change_state(state_name):
	if state_name == "idle":
		states_stack.clear()
	._change_state(state_name)

func _physics_process(delta):
	._physics_process(delta)

func _input(event):
	current_state.handle_input(event)
