class_name Bullet
extends RigidBody2D

@export var damageComponent: Node


func _on_body_entered(_body: Node) -> void:
	self.queue_free()
