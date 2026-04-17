class_name BulletWall
extends Node

@export var wall_thickness: int = 2
@export var shot_cooldown: float = 0.2
@export var height_bullet_count: int = 20
@export var wall_count: int = 3
@export var walls_cooldown: float = 2

@export var hole_size: int = 5
@export var bullet_speed: int = 300

@export var ammo_prefab: PackedScene

var arena_height
var wall_bounds
var floor_dimensions

var direction: int


func _ready():
	var arena_markers = get_tree().get_first_node_in_group("arena_area_markers")
	# x - up, y - down
	wall_bounds = Vector2(
		arena_markers.get_node("TopLeft").global_position.y,
		arena_markers.get_node("DownRight").global_position.y
	)
	arena_height = wall_bounds.y - wall_bounds.x

	floor_dimensions = Vector2(
		arena_markers.get_node("DownRight").global_position.x,
		arena_markers.get_node("TopLeft").global_position.x
	)

func use():
	# -1 or 1
	direction = randi_range(0, 1) * 2 - 1
	for i in wall_count:
		spawn_wall()
		await get_tree().create_timer(walls_cooldown).timeout


func spawn_wall():
	var hole_position = randi_range(1, height_bullet_count - hole_size - 1)
	for i in wall_thickness:
		spawn_wall_segment(hole_position)
		await get_tree().create_timer(shot_cooldown).timeout


func spawn_wall_segment(hole_position: int):
	var move_direction = Vector2.RIGHT * direction

	for i in height_bullet_count:
		if i > hole_position and i <= hole_position + hole_size:
			continue
		var bullet: RigidBody2D = ammo_prefab.instantiate()
		get_tree().current_scene.add_child(bullet)

		bullet.linear_velocity = (move_direction * bullet_speed)

		bullet.global_position = Vector2(
			floor_dimensions[int((direction + 1) / 2.0)],
			wall_bounds.x + arena_height / height_bullet_count * i + bullet.get_node("CollisionShape2D").shape.radius * 2
		)

		#COLLISION LAYERS!!!
