extends Node2D

var content: int: set = set_content

@onready var label = $Label

func set_content(_content: int) -> void:
	content = _content
	label.text = str(content)
