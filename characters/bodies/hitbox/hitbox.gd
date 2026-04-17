extends Area2D

@export var body: BodyController

func collided(node: Node2D) -> void:
	body.take_damage(node.damageComponent.get_damage())
	if node is RigidBody2D:
		node.destroy()
