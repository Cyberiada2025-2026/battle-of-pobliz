extends Node2D

func _process(delta: float) -> void:
	var test: bool = global_rotation_degrees > sign(scale.y)*90
	if scale.y > 0:
		test = test || global_rotation_degrees < -sign(scale.y) * 90
	else:
		test = test && global_rotation_degrees < -sign(scale.y) * 90
	if test:
		scale.y *= -1.0
