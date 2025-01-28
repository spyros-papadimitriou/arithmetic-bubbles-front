extends Node2D

var question: Question: set = set_question

@onready var label = $VBoxContainer/Label

func _ready() -> void:
	pass

func set_question(_question: Question) -> void:
	question = _question
	var output: String = ""
	
	#var members_size = question.members.size()
	var count: int = 0
	for member in question.members:
		count = count + 1
		output = output + (str(member.num) if count == 1 else " + " + str(member.num))
	label.text = output
