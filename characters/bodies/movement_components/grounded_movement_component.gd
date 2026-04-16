class_name GroundedMovementComponent
extends Node

@export var speed: float = 300.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Input.get_axis("move_left", "move_right")

	body.velocity.x = movement_direction * speed 



	
	
