extends Node2D

class_name Gun

@export var bullet: PackedScene
@export var start: Node2D
@export var bullet_speed: float = 1000
@export var cooldown: float = 2

var on_cooldown: float = 0

func _process(delta: float) -> void:
	if on_cooldown > 0:
		on_cooldown -= delta

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position()
		rotation = Vector2.RIGHT.angle_to((mouse_position - global_position).normalized()) 
		pass
	if Input.is_action_just_pressed("shot"):
		if on_cooldown <= 0:
			var x : Bullet = bullet.instantiate()
			get_tree().current_scene.add_child(x)
			x.global_position = start.global_position
			x.apply_central_impulse(
				Vector2.RIGHT.rotated(rotation) *
				bullet_speed
			)
			on_cooldown = cooldown
