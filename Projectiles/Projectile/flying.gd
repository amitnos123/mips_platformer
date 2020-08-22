extends State

export(float) var DESPAWN_TIME = 3
export(float) var SPEED = 100
export(Vector2) var DIRECTION = Vector2.RIGHT setget set_direction

func enter():
	$DespawnTimer.start(DESPAWN_TIME)
	owner.get_node("Animation").play("flying")

func update(delta):
	var collision = owner.move_and_collide(DIRECTION * SPEED * delta)
	if collision:
		emit_signal("finished", "hit")

# Triggers when catches an unhandled input
# @param {Vector2} value - The direction which the projectile will go at
# @returns {void}
func set_direction(value):
	DIRECTION = value.normalized()

func _on_despawn_timer_timeout():
	emit_signal("finished", "despawn")
