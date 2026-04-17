class_name Bullet
extends RigidBody2D

@export var damageComponent: Node

func collision(body: Node):
	self.queue_free()
