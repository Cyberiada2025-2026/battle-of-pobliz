extends Node2D

class_name Gun

@export var bullet: PackedScene
@export var start: Node2D
@export var bullet_speed: float = 1000

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position()
		rotation = Vector2.RIGHT.angle_to((mouse_position - global_position).normalized()) 
		pass
	if Input.is_action_just_pressed("shot"):
		var x : Bullet = bullet.instantiate()
		get_tree().current_scene.add_child(x)
		x.global_position = start.global_position
		
		x.apply_central_impulse(Vector2.RIGHT.rotated(rotation) * bullet_speed)
