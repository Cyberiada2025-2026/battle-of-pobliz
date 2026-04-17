class_name InvincibilityStatue
extends Area2D


func disable_statue() -> void:
	visible = false
	set_deferred("monitoring", false)

func enable_statue() -> void:
	visible = true
	set_deferred("monitoring", true)


func _on_body_entered(body: Node2D) -> void:
	disable_statue()
