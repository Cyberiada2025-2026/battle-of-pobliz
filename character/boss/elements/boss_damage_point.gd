extends Area2D
class_name BossDamagePoint

@export var boss: Boss


func _on_area_entered(area: Area2D) -> void:
	boss.take_damage(area.take_damage())
