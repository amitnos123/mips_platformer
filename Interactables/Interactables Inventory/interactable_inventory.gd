extends Interactable

class_name InteractableInventory

signal open_inventory(inventory_node)

# Trigger when interacting
# Intened to be changed by inherit classes and objects
# @returns {void}
func interacte(viewport, event, shape_idx):
	var playerNode = get_tree().get_nodes_in_group("player")[0]
	if $InteractableWindowInventory:
		$InteractableWindowInventory.set_visible(true)
		connect("open_inventory", playerNode, "add_window")
		emit_signal("open_inventory", $InteractableWindowInventory)
	.interacte(viewport, event, shape_idx)
