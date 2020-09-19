extends TextureRect

func _ready():
	pass


# Called when start dragging the item
# @param {Vector2} _pos - The postions of the drag in local coordinates
# @returns {Node} - The data which will be sent when dragged
func get_drag_data(_pos) -> Node:
	
	var tr = TextureRect.new()
	tr.texture = self.texture
	tr.rect_size = self.rect_size
	tr.expand = true
	set_drag_preview(tr)
	
	return self
	# Need to send: icon, level, ability 


func _on_mouse_entered():
	pass # Replace with function body.


func _on_mouse_exited():
	pass # Replace with function body.
