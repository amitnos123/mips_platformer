extends KinematicBody2D

class_name Projectile

export(float) var TIME_TO_DESPAWN = 3
export(float) var SPEED = 100 setget set_speed
export(Vector2) var DIRECTION = Vector2.RIGHT setget set_direction

func _ready():
	DIRECTION = DIRECTION.normalized()
	$DespawnTimer.start(TIME_TO_DESPAWN)
	pass

func _physics_process(delta):
	var collision = move_and_collide(DIRECTION * SPEED * delta)
	if collision:
		self.queue_free()

func set_speed(value):
	SPEED = value
	pass

func set_direction(value):
	DIRECTION = value.normalized()
	pass

func _on_despawn_timer_timeout():
	self.queue_free()
