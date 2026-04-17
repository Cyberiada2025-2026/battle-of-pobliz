class_name PossessionManager
extends Node

@export var current_body: BodyController
@export var player_camera: Camera2D
@export var ray_cast: RayCast2D
@export var camera_transfer_time: float = 0.5

@export var slowdown: float = 0.1
@export var post: ColorRect;
@export var pointer: Sprite2D
@export var offset: float = 25.0

@export var vfx_line: Line2D
@export var animator: AnimationPlayer

func _ready() -> void:
	posses_body(current_body, false)

func posses_body(body: BodyController, kill: bool = true) -> void:
	var old_body = current_body
	current_body = body
	player_camera.reparent(current_body)
	move_camera()
	if old_body != null && kill:
		old_body._on_zero_health()


func _physics_process(delta: float) -> void:
	handle_possession()

func handle_possession() -> void:
	if Input.is_action_just_pressed("possess"):
		Engine.time_scale = slowdown
		post.visible = true
	elif Input.is_action_pressed("possess"):
		ray_cast.target_position = player_camera.get_global_mouse_position() - ray_cast.global_position
		ray_cast.target_position *= 100000;
		ray_cast.force_raycast_update()

		var collider = ray_cast.get_collider() as BodyController
		if collider == null:
			pointer.visible = false
		else:
			pointer.visible = true
			pointer.global_position = collider.global_position + Vector2.UP * offset
	elif Input.is_action_just_released("possess"):
		Engine.time_scale = 1.0
		post.visible = false

		pointer.visible = false
		ray_cast.target_position = player_camera.get_global_mouse_position() - ray_cast.global_position
		ray_cast.target_position *= 100000;
		ray_cast.force_raycast_update()

		var collider = ray_cast.get_collider() as BodyController
		if collider == null:
			return

		vfx_line.points[0] = ray_cast.global_position
		vfx_line.points[1] = collider.global_position + Vector2.UP * offset;
		animator.play("switch")

		posses_body(collider)


func move_camera() -> void:
	var position_tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	position_tween.tween_property(player_camera, "position", Vector2.ZERO, camera_transfer_time)
