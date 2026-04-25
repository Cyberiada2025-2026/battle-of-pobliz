class_name JumpComponent
extends Node

@export var jump_velocity: float = 300.0
@export var max_extra_jump_count: int = 1

@export var jump_vfx: GPUParticles2D
@export var land_vfx: GPUParticles2D

@export var jump_buffer_time: float = 0.1
@export var jump_buffer_ray: RayCast2D

var body: BodyController

var wants_jump: bool = false
var is_jumping: bool = false
var landed: bool = true

var _extra_jump_count = 0
var _wants_jump_timer: float = 0

func handle_input(delta: float) -> void:
	_wants_jump_timer += delta
	if Input.is_action_just_pressed("jump"):
		wants_jump = true
		_wants_jump_timer = 0

	if _wants_jump_timer > jump_buffer_time:
		wants_jump = false


func apply(delta: float) -> void:
	handle_input(delta)
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

	if wants_jump:
		if body.is_on_floor():
			wants_jump = false
			body.velocity.y = -jump_velocity
			is_jumping = true
			jump_vfx.restart()
			jump_vfx.emitting = true
		elif _extra_jump_count < max_extra_jump_count and not jump_buffer_ray.is_colliding():
			wants_jump = false
			_extra_jump_count += 1
			is_jumping = true
			body.velocity.y = -jump_velocity
			jump_vfx.restart()
			jump_vfx.emitting = true

	if Input.is_action_just_released("jump") and body.velocity.y < 0:
		body.velocity.y /= 2
