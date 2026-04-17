class_name TargetingLaser
extends Node

@export var marker_show_time: float = 2.0
@export var attack_duration: float = 2.0
@export_range(0.05, 1, 0.05) var fill_percentage: float = 0.35

var laser_marker_prefab = preload("res://characters/boss/atacks/targeting_laser/laser_marker.tscn")
var laser_prefab = preload("res://characters/boss/atacks/targeting_laser/laser.tscn")

var floor_size
var wall_bounds: Vector2
var arena_height
var laser_width
var floor_bounds

func _ready():

	var arena_markers = get_tree().get_first_node_in_group("arena_area_markers")

	# x - left, y - right
	floor_bounds = Vector2(
		arena_markers.get_node("TopLeft").global_position.x,
		arena_markers.get_node("DownRight").global_position.x
	)
	floor_size = floor_bounds.y - floor_bounds.x
	# x - up, y - down
	wall_bounds = Vector2(
		arena_markers.get_node("TopLeft").global_position.y,
		arena_markers.get_node("DownRight").global_position.y
	)
	arena_height = wall_bounds.y - wall_bounds.x
	laser_width = floor_size * fill_percentage


func use():
	var laser_marker = laser_marker_prefab.instantiate()
	var player = get_tree().get_first_node_in_group("possession_manager").current_body
	var pos = Vector2(
		min(max(floor_bounds.x + laser_width / 2, player.position.x), floor_bounds.y - laser_width / 2),
		wall_bounds.x + arena_height / 2
	)
	add_child(laser_marker)
	laser_marker.global_position = pos

	laser_marker.get_child(0).texture.width = laser_width
	laser_marker.get_child(0).texture.height = arena_height

	# wait for marker_show_time
	await get_tree().create_timer(marker_show_time, false).timeout

	laser_marker.queue_free()

	var laser = laser_prefab.instantiate()
	add_child(laser)
	laser.global_position = pos

	laser.get_child(0).texture.width = laser_width
	laser.get_child(0).texture.height = arena_height
	laser.get_child(1).shape.size = Vector2(laser_width, arena_height)

	# wait for attack_duration
	await get_tree().create_timer(attack_duration, false).timeout

	laser.queue_free()
