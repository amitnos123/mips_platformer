extends "res://Player/States/Motion/motion.gd"

export(float) var MAX_AIR_WALK_SPEED = 70

# Initialize the state. E.g. change the animation
func enter():
	if get_parent().states_stack[1].name == 'Walk':
		MAX_AIR_WALK_SPEED = get_parent().states_stack[1].MAX_WALK_SPEED
	elif get_parent().states_stack[1].name == 'Run':
		MAX_AIR_WALK_SPEED = get_parent().states_stack[1].MAX_RUN_SPEED
	return .enter()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if input_direction:
		update_look_direction(input_direction)
	velocity.x = input_direction.x * MAX_AIR_WALK_SPEED
	.update(delta)
	if owner.is_on_floor():
		emit_signal("finished", "preview")
	return 

# Clean up the state. Reinitialize values like a timer
#func exit():
#	return
#
#func handle_input(event):
#	return
#
#func update(delta):
#	return
#
#func _on_animation_finished(anim_name):
#	return
