extends Node2D

var answer: Answer: set = set_answer
var avatar: Avatar: set = set_avatar

@onready var bubble_scene = $BubbleScene
@onready var avatar_scene = $AvatarScene
@onready var color_rect_avatar = $ColorRectAvatar
@onready var color_rect_bubble = $ColorRectBubble

func _ready() -> void:
	pass

func set_answer(_answer: Answer) -> void:
	answer = _answer
	bubble_scene.set_content(answer.result)
	
func set_avatar(_avatar: Avatar) -> void:
	avatar = _avatar
	avatar_scene.set_avatar(avatar)

func _on_color_rect_avatar_gui_input(event: InputEvent) -> void:
	_on_event_triggered(event)

func _on_color_rect_bubble_gui_input(event: InputEvent) -> void:
	_on_event_triggered(event)

func _on_event_triggered(event: InputEvent):
	if Events.is_mouse_left_button_clicked(event):
		Events.emit_signal("answer_selected", answer)
