extends Area2D
class_name BossDamagePoint

@export var boss: Boss
@export var damage_multiply: float = 1.0

func _ready() -> void:
	area_entered.connect(_damage_detection)
	body_entered.connect(_damage_detection)

func _damage_detection(node: Node) -> void:
	boss.take_damage(node.damageComponent.get_damage() * damage_multiply)
	if node is RigidBody2D:
		node.destroy()
