extends Node2D

var AnswerScene = preload("res://scenes/AnswerScene.tscn")

var avatar_service = AvatarService.new()
var exercise: Exercise
var given_answers:PackedInt64Array = []

@onready var question_scene = $QuestionScene
@onready var audio_player = $AudioStreamPlayer2D

func _ready() -> void:
	Events.connect("start_exercise_selected", Callable(self, "_on_start_exercise_selected"))
	Events.connect("exercise_created", Callable(self, "_on_exercise_created"))
	Events.connect("answer_selected", Callable(self, "_on_answer_selected"))
	Events.connect("exercise_feedback_received", Callable(self, "_on_exercise_feedback_received"))
	Events.emit_signal("start_exercise_selected")

func _on_start_exercise_selected() -> void:
	$ExerciseFeedbackScene.visible = false
	$HttpScene.create_exercise()

func _on_answer_selected(answer: Answer) -> void:
	audio_player.play()
	given_answers.push_back(answer.id)
	remove_answers()
	if exercise.questions.size():
		show_question()
	else:
		hide_question()
		submit_answers()

func _on_exercise_created(_exercise: Exercise) -> void:
	exercise = _exercise
	given_answers = []
	remove_answers()
	show_question()

func _on_exercise_feedback_received(_exercise_feedback: ExerciseFeedback) -> void:
	$ExerciseFeedbackScene.set_exercise_feedback(_exercise_feedback)
	$ExerciseFeedbackScene.visible = true

func hide_question() -> void:
	question_scene.visible = false
	
func show_question() -> void:
	question_scene.visible = true
	var question: Question = exercise.questions.pop_front()
	question_scene.set_question(question)
	
	var i: int = 0;
	var avatars: Array = avatar_service.get_random(question.answers.size())
	for answer in question.answers:
		i = i + 1
		
		var answer_scene_instance = AnswerScene.instantiate()
		answer_scene_instance.position = Vector2(-130 + (i * 200), 300)
		add_child(answer_scene_instance)
		answer_scene_instance.add_to_group("answers")
		
		answer_scene_instance.set_answer(answer)
		answer_scene_instance.set_avatar(avatars[i-1])

func remove_answers() -> void:
	for node in get_tree().get_nodes_in_group("answers"):
		node.queue_free()

func submit_answers() -> void:
	$HttpScene.submit_answers(exercise.id, given_answers)
