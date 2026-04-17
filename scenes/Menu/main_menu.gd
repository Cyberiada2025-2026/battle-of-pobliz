extends Control


@export_category("scenes")
@export var game_scene: PackedScene
@export var empty_scene: PackedScene

@export_category("nodes")
@export var start: Node
@export var resume: Node
@export var settings: Node
@export var exit: Node
@export var return_to_main_menu: Node


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		_on_resume_button_pressed()



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
	start.visible = false
	exit.visible = false
	resume.visible = true
	return_to_main_menu.visible = true
	visible = false
	get_tree().paused = false


func _on_resume_button_pressed() -> void:
	visible = not visible
	get_tree().paused = visible


func _on_setting_button_pressed() -> void:
	pass # Replace with function body.


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(empty_scene)
	start.visible = true
	exit.visible = true
	resume.visible = false
	return_to_main_menu.visible = false


func _on_exit_button_pressed() -> void:
	get_tree().quit()
