class_name JumpComponent
extends Node

@export var jump_velocity: float = 300.0
@export var max_extra_jump_count: int = 1

var body: BodyController
var _extra_jump_count = 0

var is_jumping: bool = false

func apply(_delta: float) -> void:
	if body.is_on_floor():
		_extra_jump_count = 0
		is_jumping = false

	if body.velocity.y > 0:
		is_jumping = false

	if Input.is_action_just_pressed("jump"):
		if body.is_on_floor():
			body.velocity.y = -jump_velocity
			is_jumping = true
		elif _extra_jump_count < max_extra_jump_count:
			_extra_jump_count += 1
			body.velocity.y = -jump_velocity
			is_jumping = true
