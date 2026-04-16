class_name GroundedMovementComponent
extends Node

@export var speed: float = 10.0

var body: BodyController

func apply(_delta: float) -> void:
	var movement_direction = Vector2(Input.get_axis("move_left", "move_right"), 0)

	body.velocity = movement_direction * speed 



	
	
