extends Control

@export var empty_scene: PackedScene
@export var time_label: Label
@export var body_label: Label

func _ready() -> void:
	MainMenu.activable = false
	if MainMenu.visible == true:
		MainMenu._on_resume_button_pressed()
	var score: int = MainMenu.timer
	# timer is correctly formatted for seconds value less than 10
	time_label.text = "Time: "+ str(score/60) + ":" + ("0" if score%60 < 10 else "") + str(score%60)
	body_label.text = "Remaining bodies: " + str(MainMenu.body_c)


func _on_main_menu_button_pressed() -> void:
	MainMenu._on_main_menu_button_pressed()
	MainMenu._on_resume_button_pressed()
