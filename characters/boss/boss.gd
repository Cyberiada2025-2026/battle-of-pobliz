extends Node2D
class_name Boss

signal atack_signal

@export_category("nodes")
@export var canon_left: Node2D
@export var canon_right: Node2D
@export var head: Node2D


@export_category("Single Atacks")
@export var health: float = 1000
@export var fase_health_points: Array[float] = [
	0
]

@export_category("Atack Sets")
@export var fase_1_atack_set: Array[Node]



var current_atack_set: Array[Node]



func _ready() -> void:
	current_atack_set = fase_1_atack_set


func take_damage(damage: float) -> void:
	health -= damage
	if health <= 0:
		pass # TO DO WIN!!!!!!!!!!!!!!!!!!!!!!!!!!


func _on_atack_signal() -> void:
	print("ATACK")
	random_atack()


func random_atack() -> void:
	var atack_set = current_atack_set
	var atack = atack_set.pick_random()
	atack_set.erase(atack)
	if atack == null:
		print("NO ATACK IN SET")
	else:
		await atack.use()
	atack_set.append(atack)
