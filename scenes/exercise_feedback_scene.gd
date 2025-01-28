extends Node2D

var exercise_feedback: ExerciseFeedback: set = set_exercise_feedback

@onready var label_exercise = $GridContainer/VBoxContainerLeft/LabelExercise
@onready var label_success_rate = $GridContainer/VBoxContainerLeft/LabelSuccessRate
@onready var questions_container = $GridContainer/VBoxContainerRight/GridContainer

func _ready() -> void:
	pass
	#var e: ExerciseFeedback = ExerciseFeedback.new()
	#for i in range(1, 6):
		#var q = QuestionFeedback.new()
		#q.id = i
		#q.answer_correct = 5
		#q.answer_given = 10
		#q.correct = true
		#e.questions.push_back(q)
	#
	#set_exercise_feedback(e)

func set_exercise_feedback(_exercise_feedback) -> void:
	exercise_feedback = _exercise_feedback
	var output: String = ""
	output = output + "Exercise Id: " + str(exercise_feedback.id)
	output = output + "\nDate Created: " + exercise_feedback.date_created
	output = output + "\nDate Completed: " + exercise_feedback.date_finished

	output = output + "\n\nTotal Bubbles: " + str(exercise_feedback.number_of_questions)
	output = output + "\nTotal Correct Bubbles: " + str(exercise_feedback.number_of_correct_answers)
	output = output + "\nTotal Incorrect Bubbles: " + str(exercise_feedback.number_of_incorrect_answers)
	label_exercise.text = output
	label_success_rate.text = "Success Rate: " + str(exercise_feedback.percentage_correct) + "%"
	$FeelingScene.set_success_rate(exercise_feedback.percentage_correct)

	remove_questions()
	var count_questions: int = 0
	for question_feedback in exercise_feedback.questions:
		count_questions = count_questions + 1
		var label = Label.new()
		output = "Question Id: " + str(question_feedback.id)
		output = output + "\nCorrect Answer: " + str(question_feedback.answer_correct)
		output = output + "\nGiven Answer: " + str(question_feedback.answer_given)
		output = output + "\n" + ("Correct!" if question_feedback.correct else "Wrong!")
		label.text = output
		
		questions_container.add_child(label)
		label.add_to_group("questions")
		if count_questions % 2 == 0:
			var h_separator: HSeparator = HSeparator.new()
			h_separator.add_to_group("questions")
			questions_container.add_child(h_separator)
			h_separator = HSeparator.new()
			h_separator.add_to_group("questions")
			questions_container.add_child(h_separator)

func remove_questions() -> void:
	for node in get_tree().get_nodes_in_group("questions"):
		node.queue_free()

func _on_button_pressed() -> void:
	Events.emit_signal("start_exercise_selected")

func _on_button_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenuScene.tscn")
