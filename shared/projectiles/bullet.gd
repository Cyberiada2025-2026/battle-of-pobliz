class_name Bullet
extends RigidBody2D



func _on_body_entered(body: Node) -> void:
	print("collide")
	self.queue_free()
