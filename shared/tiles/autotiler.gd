@tool
class_name Autotiler
extends TileMapLayer

@export var base_tilemap: TileMapLayer

func _ready() -> void:
	base_tilemap.changed.connect(_on_base_tilemap_changed)


func _on_base_tilemap_changed() -> void:
	clear()
	var terrain_locations: Array[Vector2i] = []
	for c in base_tilemap.get_used_cells():
		terrain_locations.append_array(get_dual_grid_surroundings(c))

	set_cells_terrain_connect(terrain_locations, 0, 0)


func get_dual_grid_surroundings(coords: Vector2i) -> Array[Vector2i]:
	var res: Array[Vector2i]= []
	for i in 2:
		for j in 2:
			res.push_back(coords + Vector2i(i, j))

	return res

