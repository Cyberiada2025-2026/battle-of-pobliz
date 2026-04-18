extends CanvasItem

const anim: String = "anim"

@export var time: float = 0.15

var block: bool = false

func flash() -> void:
	if block:
		return
	var tween = get_tree().create_tween()
	tween.tween_method(
  func(value): material.set_shader_parameter("anim", value),  
  0.0,  # Start value
  1.0,  # End value
  time     # Duration
);

func lock() -> void:
	block = true

func unlock() -> void:
	block = false
