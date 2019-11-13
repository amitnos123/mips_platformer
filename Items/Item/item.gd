extends Node
#Class for saving the metadata of an item
class_name Item

var code : int = 0
var generated_code : int = 0
var dropAnimation : SpriteFrames = null
var inventorySprite : Texture = null
var dropAudio : AudioStream = null
var pickAudio : AudioStream = null

func _init(code, generated_code, dropAnimation, inventorySprite, dropAudio = null, pickAudio = null):
	self.code = code
	self.generated_code = generated_code
	self.dropAnimation = dropAnimation
	self.inventorySprite = inventorySprite
	self.dropAudio = dropAudio
	self.pickAudio = pickAudio

func create_item_drop():
	pass