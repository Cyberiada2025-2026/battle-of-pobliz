class_name StatueManager
extends Node2D

@export var boss: Boss
@export var statue_timer: Timer

var statues: Array[InvincibilityStatue] 
var _destroyed_statues: int = 0

func _ready() -> void:
	statues.assign(get_children().filter(func(c): return c is InvincibilityStatue) as Array[InvincibilityStatue])
	statue_timer.timeout.connect(start_invincibility)
	for statue in statues:
		statue.disable_statue()
		statue.body_entered.connect(_on_statue_destroyed)


func start_invincibility() -> void:
	_destroyed_statues = 0
	boss.is_invincible = true
	for statue in statues:
		statue.enable_statue()


func _on_statue_destroyed(_body):
	_destroyed_statues += 1
	if _destroyed_statues >= statues.size():
		boss.is_invincible = false
		statue_timer.start()





	
