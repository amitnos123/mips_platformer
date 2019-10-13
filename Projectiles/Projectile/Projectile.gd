extends KinematicBody2D

class_name projectile

export(float) var timeToDespawn = 3
export(float) var speed = 100 setget set_speed
export(Vector2) var direction = Vector2.RIGHT setget set_direction

func _ready():
	direction = direction.normalized()
	$DespawnTimer.start(timeToDespawn)
	pass

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		print_debug(collision.collider.name)
		self.queue_free()

func set_speed(value):
	speed = value
	pass

func set_direction(value):
	direction = value.normalized()
	pass


func _on_DespawnTimer_timeout():
	self.queue_free()
