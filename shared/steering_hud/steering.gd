extends Control

@export var jump_steering: Control
@export var flight_steering: Control



func _on_possession_manager_body_changed(body_type: String) -> void:
	if body_type == "jump":
		jump_steering.visible = true
		flight_steering.visible = false
	else:
		jump_steering.visible = false
		flight_steering.visible = true
