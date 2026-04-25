class_name FlightMovementComponent
extends Node

@export var max_speed: float = 200.0
@export var acceleration: float = 100.0
@export var deceleration: float = 100.0

var body: BodyController

func get_vel_change(movement_direction: Vector2) -> Vector2:
	var vel_change: Vector2 = Vector2.ZERO
	if movement_direction.is_zero_approx():
		vel_change = -((body.velocity.normalized() * deceleration).min(body.velocity))
		return vel_change

	vel_change = movement_direction
	if sign(movement_direction.x) != sign(body.velocity.x):
		vel_change.x *= deceleration
	else:
		vel_change.x *= acceleration

	if sign(movement_direction.y) != sign(body.velocity.y):
		vel_change.y *= deceleration
	else:
		vel_change.y *= acceleration

	return vel_change


func apply(_delta: float) -> void:
	var movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	var vel_change = get_vel_change(movement_direction)
	body.velocity = (body.velocity + vel_change).limit_length(max_speed)
