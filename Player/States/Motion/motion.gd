extends "res://State Machine/state.gd"

export(float) var GRAVITY_SPEED = 50

var velocity = Vector2()

func enter():
	var input_direction = get_input_direction()
	update_look_direction(input_direction)

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	#If pressed move_right, then x will be possitive
	#If pressed move_left, then x will be negetive
	#If move_right and move_left are pressed, then x will zero
	input_direction.y = 0
	return input_direction

func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.look_direction = direction

func move(floor_vector = Vector2.UP):
	owner.move_and_slide(velocity, floor_vector)
	return

func update(delta):
	velocity.y += GRAVITY_SPEED
	move()
	return
