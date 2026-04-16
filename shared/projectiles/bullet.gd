class_name Bullet
extends RigidBody2D


func collision():
	self.queue_free()
