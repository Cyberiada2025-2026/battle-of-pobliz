class_name Bullet
extends RigidBody2D


func collision():
	print("delete")
	self.queue_free()
