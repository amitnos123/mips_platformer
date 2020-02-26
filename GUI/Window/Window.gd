extends Control

#export(String) var labelText setget set_label_text, get_label_text

func _ready():
	pass

#func set_label_text(value):
#	labelNodePath.text = value
#
#func get_label_text():
#	return labelNodePath.text

func _on_CloseButton_pressed():
	self.set_visible(false)
