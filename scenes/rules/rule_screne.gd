extends Control

@export var gamee_scene: PackedScene
@export var text: Label
@export var next: Node


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(gamee_scene)
