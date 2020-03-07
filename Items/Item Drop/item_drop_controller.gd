extends Area2D

signal picked(itemData)

var itemData : Item = null

onready var playerInArea : Player = null

func _on_ItemDrop_body_entered(body):
	if body is Player:
		playerInArea = body
		connect('picked', playerInArea, '_add_item')

func _on_ItemDrop_body_exited(body):
	if body is Player:
		playerInArea = null
		disconnect('picked', playerInArea, '_add_item')
