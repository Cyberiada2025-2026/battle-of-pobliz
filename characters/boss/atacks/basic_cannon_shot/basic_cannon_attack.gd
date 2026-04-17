class_name CannonAttack
extends Node

@export var shot_count: int = 1
@export var shot_cooldown: float = 0.2
@export var shot_series: int = 2
@export var shot_series_cooldown: float = 0.5

@export var bullet_speed: float = 0.2
@export var lock_target_on_first_shot: bool = false


@export var cannons: Array[BossCanon]

@export var ammo_prefab: Resource
#var bullet_prefab = preload("res://shared/projectiles/boss/basic_bullet.tscn")


func use():
	var offset = randi_range(0, cannons.size())
	for i in shot_series:
		shot_serie(cannons[(i + offset) % cannons.size()])
		await get_tree().create_timer(shot_series_cooldown).timeout


func shot_serie(cannon: BossCanon):
	var player = get_tree().get_first_node_in_group("possession_manager").current_body
	var move_direction = (player.global_position - cannon.global_position).normalized()
	for i in shot_count:
		var bullet: RigidBody2D = ammo_prefab.instantiate()
		get_tree().current_scene.add_child(bullet)

		if not lock_target_on_first_shot:
			move_direction = (player.global_position - cannon.global_position).normalized()

		bullet.apply_central_impulse(move_direction * bullet_speed)
		bullet.global_position = cannon.global_position

		await get_tree().create_timer(shot_cooldown).timeout
