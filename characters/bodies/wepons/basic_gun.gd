extends Node2D

class_name Gun

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position()
		rotation = Vector2.RIGHT.angle_to((mouse_position - global_position).normalized()) 
		pass
	if Input.is_action_just_pressed("shot"):
		print("shot")
		pass
