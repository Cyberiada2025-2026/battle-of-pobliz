class_name PossessionManager
extends Node

@export var current_body: BodyController
@export var player_camera: Camera2D
@export var ray_cast: RayCast2D

func _ready() -> void:
	posses_body(current_body)

func posses_body(body: BodyController) -> void:
	current_body = body
	player_camera.reparent(current_body)
	print("possessed ", current_body) 


func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("possess"):
		ray_cast.target_position = player_camera.get_global_mouse_position() - ray_cast.global_position
		ray_cast.force_raycast_update()
		prints(ray_cast.position, ray_cast.target_position)

		var collider = ray_cast.get_collider() as BodyController
		if collider == null:
			print("possession failed")
			return

		posses_body(collider)
