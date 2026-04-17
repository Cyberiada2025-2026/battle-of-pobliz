class_name JumpComponent
extends Node

@export var jump_velocity: float = 300.0
@export var max_jump_count: int = 1

var body: BodyController
var _jump_count = 0

func apply(_delta: float) -> void:
	if body.is_on_floor():
		_jump_count = 0

	if Input.is_action_just_pressed("jump") and _jump_count < max_jump_count:
		_jump_count += 1
		body.velocity.y = -jump_velocity
