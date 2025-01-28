extends Node2D

var avatar: Avatar: set = set_avatar

@onready var sprite = $Sprite2D
@onready var label = $Label

func set_avatar(_avatar: Avatar) -> void:
	avatar = _avatar
	label.text = avatar.name
	
	var path: String = "res://assets/img/avatars/" + str(avatar.id) + ".png"
	var texture = load(path)
	sprite.texture = texture
