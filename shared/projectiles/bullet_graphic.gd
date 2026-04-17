@tool
extends Node2D
class_name  BulletGraphic

 
@export var bullet_basic: Node
@export var bullet_shot: GPUParticles2D
@export var bullet_hit: GPUParticles2D


func _get_configuration_warnings() -> PackedStringArray:
	var array : PackedStringArray
	if bullet_basic == null:
		array.append("add bullet basic")
	if bullet_hit == null:
		array.append("add bullet hit")
	if bullet_shot == null:
		array.append("add bullet shot")
	return array
