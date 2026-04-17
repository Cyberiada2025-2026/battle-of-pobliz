class_name TargetingBullet
extends RigidBody2D

@export var damageComponent: Node
@export var bullet_graphic: BulletGraphic
@export var tween_hit_animation_time: float = 0.4

@export var max_rotation_per_second: float = 20

func _ready() -> void:
	# rotate graphic
	bullet_graphic.bullet_shot.emitting = true


func _on_body_entered(_body: Node) -> void:
	bullet_graphic.bullet_hit.emitting = true
	call_deferred("set_contact_monitor", false)
	bullet_graphic.bullet_basic.queue_free()
	var t: Tween = create_tween()
	t.tween_interval(tween_hit_animation_time)
	t.tween_callback(self.queue_free)


func _physics_process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("possession_manager").current_body
	#var move_direction: Vector2 = (player.global_position - global_position).normalized()

	var angle_player = Vector2.RIGHT.angle_to(player.global_position - global_position)
	var angle_diff = angle_difference(angle_player, linear_velocity.angle())


	var current_speed = linear_velocity.length()
	if deg_to_rad(max_rotation_per_second) * delta < abs(angle_diff):
		angle_diff = deg_to_rad(max_rotation_per_second) * delta * sign(angle_diff)
	var new_dir = Vector2.RIGHT.rotated(linear_velocity.angle() - angle_diff)

	linear_velocity = new_dir * current_speed



func destroy():
	queue_free()
