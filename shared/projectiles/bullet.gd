class_name Bullet
extends RigidBody2D


func collision():
	print("delete")
	self.queue_free()


func _physics_process(delta: float) -> void:
	print(linear_velocity)
