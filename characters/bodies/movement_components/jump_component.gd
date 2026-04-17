class_name JumpComponent
extends Node

@export var jump_velocity: float = 300.0
@export var max_extra_jump_count: int = 1

@export var jump_vfx: GPUParticles2D
@export var land_vfx: GPUParticles2D

var landed: bool = true

var body: BodyController
var _extra_jump_count = 0

var is_jumping: bool = false

func apply(_delta: float) -> void:
	if body.is_on_floor():
		_extra_jump_count = 0
		is_jumping = false
		if !landed:
			landed = true
			land_vfx.restart()
			land_vfx.emitting = true

	if body.velocity.y > 0:
		is_jumping = false
	elif body.velocity.y < 0:
		landed = false

	if Input.is_action_just_pressed("jump"):
		if body.is_on_floor():
			body.velocity.y = -jump_velocity
			is_jumping = true
			jump_vfx.restart()
			jump_vfx.emitting = true
		elif _extra_jump_count < max_extra_jump_count:
			_extra_jump_count += 1
			body.velocity.y = -jump_velocity
			jump_vfx.restart()
			jump_vfx.emitting = true
