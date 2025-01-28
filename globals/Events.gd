extends Node

@warning_ignore("unused_signal")
signal start_exercise_selected

@warning_ignore("unused_signal")
signal answer_selected(answer)

@warning_ignore("unused_signal")
signal exercise_created(exercise)

@warning_ignore("unused_signal")
signal exercise_feedback_received(exercise_feedback)

func is_mouse_left_button_clicked(event: InputEvent) -> bool:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				return true
	return false
