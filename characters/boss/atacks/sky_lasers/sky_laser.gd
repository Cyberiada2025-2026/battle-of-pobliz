@tool
class_name SkyLaser
extends Node

@export_tool_button("test") var test = use
@export var laser_count: int = 5
@export var marker_show_time: float = 2.0
@export var attack_duration: float = 2.0
@export_range(0.05, 1, 0.05) var fill_percentage: float = 0.35

var laser_marker_prefab = preload("res://characters/boss/atacks/sky_lasers/laser_marker.tscn")
var laser_prefab = preload("res://characters/boss/atacks/sky_lasers/laser.tscn")

var floor_size
var wall_bounds: Vector2
var arena_height
var laser_width

func _ready():

	var arena_markers = get_tree().get_first_node_in_group("arena_area_markers")

	floor_size = arena_markers.get_node("DownRight").global_position.x - arena_markers.get_node("TopLeft").global_position.x
	# x - up, y - down
	wall_bounds = Vector2(
		arena_markers.get_node("TopLeft").global_position.y,
		arena_markers.get_node("DownRight").global_position.y
	)
	arena_height = wall_bounds.y - wall_bounds.x
	laser_width = floor_size / laser_count * fill_percentage


func use():
	var offset = randi_range(0, 1)

	for i in laser_count:
		var laser_marker = laser_marker_prefab.instantiate()
		add_child(laser_marker)
		laser_marker.global_position.y = wall_bounds.x + arena_height / 2
		laser_marker.global_position.x = floor_size / laser_count * (i + offset * 0.5) + laser_width / 2

		laser_marker.get_child(0).texture.width = laser_width
		laser_marker.get_child(0).texture.height = arena_height

	# wait for marker_show_time
	await get_tree().create_timer(marker_show_time, false).timeout

	for marker in get_children():
		marker.queue_free()

	for i in laser_count:
		var laser = laser_prefab.instantiate()
		add_child(laser)
		laser.global_position.y = wall_bounds.x + arena_height / 2
		laser.global_position.x = floor_size / laser_count * (i + offset * 0.5) + laser_width / 2

		laser.get_child(0).texture.width = laser_width
		laser.get_child(0).texture.height = arena_height
		laser.get_child(1).shape.size = Vector2(laser_width, arena_height)

	# wait for attack_duration
	await get_tree().create_timer(attack_duration, false).timeout

	for laser in get_children():
		laser.queue_free()
