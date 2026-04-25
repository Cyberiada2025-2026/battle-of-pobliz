class_name GroundedMovementComponent
extends Node

@export var max_speed: float = 300.0
@export var acceleration: float = 100.0
@export var deceleration: float = 100.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Input.get_axis("move_left", "move_right")

	var vel_change: float = 0.0
	if is_zero_approx(movement_direction):
		vel_change = -min(sign(body.velocity.x) * deceleration, body.velocity.x)
	elif sign(movement_direction) != sign(body.velocity.x):
		vel_change = movement_direction * deceleration
	else:
		vel_change = movement_direction * acceleration 

	body.velocity.x = clamp(body.velocity.x + vel_change, -max_speed, max_speed)



	
	
