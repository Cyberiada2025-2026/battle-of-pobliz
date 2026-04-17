class_name DashComponent
extends Node

@export var dash_speed: float = 1500.0
@export var dash_duration: float = 0.15
@export var dash_cooldown_duration: float = 1.0
var body: BodyController

var is_dashing: bool = false
var can_dash: bool = true

func apply(_delta: float) -> void:
	if is_zero_approx(body.velocity.x):
		return

	if Input.is_action_just_pressed("dash") and can_dash:
		can_dash = false
		is_dashing = true
		var dash_timer = get_tree().create_timer(dash_duration)
		dash_timer.timeout.connect(_on_dash_finished)

	if is_dashing:
		var dash_dir = sign(body.velocity.x)
		body.velocity.x = dash_dir * dash_speed

func _on_dash_finished() -> void:
	is_dashing = false
	await get_tree().create_timer(dash_cooldown_duration).timeout
	can_dash = true

