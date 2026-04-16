class_name PossessionManager
extends Node

@export var current_body: BodyController
@export var player_camera: Camera2D
@export var ray_cast: RayCast2D
@export var camera_transfer_time: float = 0.5

func _ready() -> void:
	posses_body(current_body)

func posses_body(body: BodyController) -> void:
	current_body = body
	player_camera.reparent(current_body)
	move_camera()


func _physics_process(delta: float) -> void:
	handle_possession()

func handle_possession() -> void:
	if Input.is_action_just_released("possess"):
		ray_cast.target_position = player_camera.get_global_mouse_position() - ray_cast.global_position
		ray_cast.force_raycast_update()

		var collider = ray_cast.get_collider() as BodyController
		if collider == null:
			return

		posses_body(collider)


func move_camera() -> void:
	var position_tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	position_tween.tween_property(player_camera, "position", Vector2.ZERO, camera_transfer_time)
