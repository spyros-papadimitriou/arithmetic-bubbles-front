extends Node2D


func _on_button_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenuScene.tscn")
