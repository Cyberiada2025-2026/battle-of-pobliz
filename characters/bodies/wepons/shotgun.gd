extends Node2D

class_name Shotgun

@export var bullet: PackedScene
@export var start: Node2D
@export var bullet_speed: float = 1000
@export var cooldown: float = 2
@export var max_magasine: int = 2
@export var bullet_count: int = 5
@export var spread_angle: float = deg_to_rad(15)

var on_cooldown: float = 0
var cur_magazine: int = 0

func _ready() -> void:
	cur_magazine = max_magasine

func _process(delta: float) -> void:
	if on_cooldown > 0:
		on_cooldown -= delta
		if on_cooldown <= 0:
			on_cooldown = 0
			cur_magazine = max_magasine

func _input(event: InputEvent) -> void:
	if get_tree().get_first_node_in_group("possession_manager").current_body == get_parent(): 
		if event is InputEventMouseMotion:
			var mouse_position = get_global_mouse_position()
			rotation = Vector2.RIGHT.angle_to((mouse_position - global_position).normalized()) 
			pass
		if Input.is_action_just_pressed("shot"):
			if cur_magazine > 0:
				for i in range(bullet_count):
					var x : Bullet = bullet.instantiate()
					get_tree().current_scene.add_child(x)
					x.global_position = start.global_position
					x.apply_central_impulse(
						(Vector2.RIGHT.rotated(rotation) * bullet_speed).
						rotated(randf_range(-spread_angle, spread_angle))
					)
				cur_magazine -= 1
				if cur_magazine <= 0:
					on_cooldown = cooldown
