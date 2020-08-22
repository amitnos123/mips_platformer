extends KinematicBody2D

class_name Projectile

export(float) var DESPAWN_TIME = 3 setget set_despawn_time
export(float) var SPEED = 100 setget set_speed
export(Vector2) var DIRECTION = Vector2.RIGHT setget set_direction

onready var flying_node = $States/Flying

func _ready():
	flying_node.DESPAWN_TIME = DESPAWN_TIME
	flying_node.SPEED = SPEED
	flying_node.DIRECTION = DIRECTION

func set_despawn_time(value):
	DESPAWN_TIME = value
	flying_node.DESPAWN_TIME
	pass

func set_speed(value):
	SPEED = value
	flying_node.SPEED

func set_direction(value):
	DIRECTION = value
	flying_node.DIRECTION
