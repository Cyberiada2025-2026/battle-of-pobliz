class_name Platform
extends StaticBody2D

@export var destruction_timeout: float = 5

var timeout: float = 0


func _process(delta: float) -> void:
	if timeout > 0:
		timeout -= delta
		if timeout <= 0:
			show()
			get_node("CollisionShape2D").disabled = false


func destroy():
	timeout = destruction_timeout
	get_node("CollisionShape2D").set_deferred("disabled", true)
	hide()
