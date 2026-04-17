extends Area2D

@export var body: BodyController

func collided(node: Node2D) -> void:
	body.take_damage(node.damageComponent.get_damage())
