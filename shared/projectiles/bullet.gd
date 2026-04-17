class_name Bullet
extends RigidBody2D



func _on_body_entered(_body: Node) -> void:
	self.queue_free()
