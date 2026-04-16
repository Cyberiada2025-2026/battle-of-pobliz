class_name GroundedMovementComponent
extends Node

@export var max_speed: float = 300.0
@export var acceleration: float = 100.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Input.get_axis("move_left", "move_right")

	var vel_change = movement_direction * acceleration 

	body.velocity.x = clamp(body.velocity.x + vel_change, -max_speed, max_speed)



	
	
