class_name TargetingBullet
extends RigidBody2D

@export var damageComponent: Node
@export var bullet_graphic: BulletGraphic
@export var tween_hit_animation_time: float = 0.4

@export var targetting_power: float = 0.1
@export var max_velocity:float = 0.1

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
	var move_direction: Vector2 = (player.global_position - global_position).normalized()

	print("s")
	print(rad_to_deg(linear_velocity.angle()))


	print(rad_to_deg(Vector2.RIGHT.angle_to(player.global_position - global_position)))


	#
	#linear_velocity = linear_velocity.length() / max_velocity * linear_velocity
	#print(linear_velocity)
	#apply_central_impulse(move_direction * targetting_power * delta)
	#print(linear_velocity)


func destroy():
	queue_free()
