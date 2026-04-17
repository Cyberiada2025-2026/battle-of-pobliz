extends Control

@export var empty_scene: PackedScene

func _ready() -> void:
	MainMenu.activable = false
	if MainMenu.visible == true:
		MainMenu._on_resume_button_pressed()


func _on_main_menu_button_pressed() -> void:
	MainMenu._on_main_menu_button_pressed()
	MainMenu._on_resume_button_pressed()
