class_name FlightMovementComponent
extends Node

@export var speed: float = 200.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	body.velocity = movement_direction * speed
