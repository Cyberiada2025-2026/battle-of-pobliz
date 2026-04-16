class_name GravityComponent
extends Node

var body: BodyController
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply(delta: float) -> void:
	body.velocity.y += gravity * delta

