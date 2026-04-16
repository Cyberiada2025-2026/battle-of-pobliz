@tool
class_name SkyLaser
extends Node

@export_tool_button("test") var test = use
@export var arena_bottom_collider: CollisionShape2D
@export var arena_wall_collider: CollisionShape2D
@export var laser_count: int
@export var marker_show_time: float = 2.0
@export var attack_duration: float = 2.0

var laser_marker_prefab = preload("res://shared/boss_attacks/sky_lasers/laser_marker.tscn")
var laser_prefab = preload("res://shared/boss_attacks/sky_lasers/laser.tscn")

var markers
var lasers

var floor_bounds: Vector2
var floor_size
var wall_bounds: Vector2
var arena_height
var laser_width

func _ready():
	markers = $Markers
	lasers = $Lasers
	# x - left, y - right
	floor_bounds = Vector2(
		arena_bottom_collider.position.x - arena_bottom_collider.shape.size.x / 2,
		arena_bottom_collider.position.x + arena_bottom_collider.shape.size.x / 2
	)
	floor_size = floor_bounds.y - floor_bounds.x
	# x - up, y - down
	wall_bounds = Vector2(
		arena_wall_collider.position.y - arena_wall_collider.shape.size.y / 2,
		arena_wall_collider.position.y + arena_wall_collider.shape.size.y / 2
	)
	arena_height = wall_bounds.y - wall_bounds.x
	laser_width = floor_size / laser_count / 2

	for i in range(laser_count):
		var laser_marker = laser_marker_prefab.instantiate()
		markers.add_child(laser_marker)
		laser_marker.global_position.y = wall_bounds.x + arena_height / 2

		laser_marker.get_child(0).texture.width = laser_width
		laser_marker.get_child(0).texture.height = arena_height
		laser_marker.hide()

		var laser = laser_prefab.instantiate()
		lasers.add_child(laser)
		laser.global_position.y = wall_bounds.x + arena_height / 2

		laser.get_child(0).texture.width = laser_width
		laser.get_child(0).texture.height = arena_height
		laser.get_child(1).shape.size = Vector2(laser_width, arena_height)
		laser.hide()



func use():
	print(floor_bounds)

	var offset = randi_range(0, 1)

	var i = 0
	for marker in markers.get_children():
		marker.global_position.x = floor_size / laser_count * (i + offset * 0.5) + laser_width / 2
		i += 1
		marker.show()

	# wait for marker_show_time
	await get_tree().create_timer(marker_show_time).timeout

	for marker in markers.get_children():
		marker.hide()

	i = 0
	for laser in lasers.get_children():
		laser.global_position.x = floor_size / laser_count * (i + offset * 0.5) + laser_width / 2
		i += 1
		laser.show()

	# wait for attack_duration
	await get_tree().create_timer(attack_duration).timeout

	for laser in lasers.get_children():
		laser.hide()
