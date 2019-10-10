extends "res://Items/Item/item_controller.gd"

export(bool) var player_in_pick_area = false

func _on_ItemDrop_body_entered(body):
	if body.name == "Player":
		player_in_pick_area = true

func _on_ItemDrop_body_exited(body):
	if body.name == "Player":
		player_in_pick_area = false
