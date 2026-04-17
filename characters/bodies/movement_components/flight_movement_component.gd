class_name FlightMovementComponent
extends Node

@export var max_speed: float = 200.0
@export var acceleration: float = 100.0
@export var deceleration: float = 100.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	var vel_change: Vector2 = Vector2.ZERO
	if movement_direction.is_zero_approx():
		vel_change = -((body.velocity.normalized() * deceleration).min(body.velocity))
	else:
		vel_change = movement_direction * acceleration

	body.velocity = (body.velocity + vel_change).limit_length(max_speed)
