extends Node2D

@onready var sprite = $Sprite2D

var success_rate: float: set = set_success_rate
var images: Array = []

func set_success_rate(_success_rate: float) -> void:
	success_rate = _success_rate
	
func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	var target: String
	if success_rate < 20:
		target = "worried"
	elif success_rate < 60:
		target = "dissapointment"
	elif success_rate < 90:
		target = "relaxed"
	else:
		target = "nerd"
	sprite.texture = load("res://assets/img/feelings/" + target + ".png")
		
