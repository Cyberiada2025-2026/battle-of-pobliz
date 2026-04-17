@tool
extends TileMapLayer

func _update_cells(_coords: Array[Vector2i], _forced_clean: bool) -> void:
	changed.emit()
