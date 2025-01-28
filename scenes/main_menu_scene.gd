extends Node2D

var target_scene: String

func _on_button_start_pressed() -> void:
	target_scene = "res://MainScene.tscn"
	change_scene()
	
func _on_button_exit_pressed() -> void:
	get_tree().quit()

func _on_button_credits_pressed() -> void:
	target_scene = "res://scenes/CreditsScene.tscn"
	change_scene()

func change_scene() -> void:
	get_tree().change_scene_to_file(target_scene)
