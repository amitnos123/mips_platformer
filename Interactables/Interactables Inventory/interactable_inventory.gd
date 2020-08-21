extends Interactable

class_name InteractableInventory

signal open_inventory(inventory_node)

func interacte(viewport, event, shape_idx):
	print('interacte')
	var playerNode = get_tree().get_nodes_in_group("player")[0]
	if $InteractableWindowInventory:
		$InteractableWindowInventory.set_visible(true)
#		$InteractableWindowInventory.rect_global_position = playerNode.position
		connect("open_inventory", playerNode, "add_window")
		emit_signal("open_inventory", $InteractableWindowInventory)
