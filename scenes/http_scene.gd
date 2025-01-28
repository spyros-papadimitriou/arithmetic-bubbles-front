extends Node2D

#var base_url: String = "http://localhost:1160/"
var base_url: String = "http://vmi388431.contaboserver.net:9999/arithmetic_bubbles/"
var headers = ["Content-Type: application/json"]

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	$Loader.rotation = $Loader.rotation + deg_to_rad(180 * delta)

func create_exercise() -> void:
	$HTTPRequestCreateExercise.request(base_url + "exercise/create", headers, HTTPClient.METHOD_POST)
	$Loader.visible = true

func submit_answers(exercise_id: int, answers: PackedInt64Array) -> void:
	var data = {
		"exerciseId": exercise_id,
		"answers": answers
	}
	var payload: String = JSON.stringify(data)
	
	$HTTPRequestSubmitAnswers.request(base_url + "submit-answers", headers, HTTPClient.METHOD_POST, payload)
	$Loader.visible = true

func _on_http_request_create_exercise_request_completed(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	$Loader.visible = false
	var json = JSON.parse_string(body.get_string_from_utf8())
	if response_code != 200:
		print("Σφάλμα κατά την αποστολή αιτήματος δημιουργίας άσκησης.")
	else:
		var exercise: Exercise = Exercise.new()
		exercise.id = json.id
		exercise.date_created = json.dateCreated
		exercise.date_finished = json.dateFinished if json.dateFinished else ""
		
		var q_index: int = 0
		for q in json.questions:
			var question: Question = Question.new()
			question.id = q.id
			q_index = q_index + 1
			question.index = q_index
			
			for m in q.members:
				var member: Member = Member.new()
				member.id = m.id
				member.num = m.num
				
				var operand:Operand = Operand.new()
				operand.id = m.operand.id
				operand.name = m.operand.name
				m.operand = operand
				
				question.members.push_back(member)
				
			for a in q.answers:
				var answer: Answer = Answer.new()
				answer.id = a.id
				answer.result = a.result
				
				question.answers.push_back(answer)
			exercise.questions.push_back(question)
		
		Events.emit_signal("exercise_created", exercise)	


func _on_http_request_submit_answers_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	$Loader.visible = false
	
	if response_code != 200:
		print("Σφάλμα κατά την αποστολή των απαντήσεων.")
	else:
		var json = JSON.parse_string(body.get_string_from_utf8())
		var exercise_feedback: ExerciseFeedback = ExerciseFeedback.new()
		
		exercise_feedback.id = json.id
		exercise_feedback.date_created = json.dateCreated
		exercise_feedback.date_finished = json.dateFinished if json.dateFinished != null else ""
		exercise_feedback.number_of_questions = json.numberOfQuestions
		exercise_feedback.number_of_correct_answers = json.numberOfCorrectAnswers
		exercise_feedback.number_of_incorrect_answers = json.numberOfIncorrectAnswers
		exercise_feedback.percentage_correct = json.percentageCorrect
		
		for q in json.questions:
			var question_feedback: QuestionFeedback = QuestionFeedback.new()
			question_feedback.id = q.id
			question_feedback.answer_given = q.answerGiven
			question_feedback.answer_correct = q.answerCorrect
			question_feedback.correct = q.correct
		
			exercise_feedback.questions.push_back(question_feedback)
			
		
		Events.emit_signal("exercise_feedback_received", exercise_feedback)
