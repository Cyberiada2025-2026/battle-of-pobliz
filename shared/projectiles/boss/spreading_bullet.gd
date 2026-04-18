class_name SpreadingBullet
extends RigidBody2D

@export var damageComponent: Node
@export var bullet_graphic: BulletGraphic
@export var tween_hit_animation_time: float = 0.4
@export var spreaded_bullet_count: int = 5
@export var spreaded_bullet: PackedScene
@export var spreaded_bullet_speed = 500
@export var can_destroy_platforms: bool = false
@export var random_angle_offset: bool = false

func _ready() -> void:
	# rotate graphic
	bullet_graphic.bullet_shot.emitting = true

func _on_body_entered(body: Node) -> void:
	if body is Platform and can_destroy_platforms:
		print("F")
		body.destroy()
	spread()
	bullet_graphic.bullet_hit.emitting = true
	call_deferred("set_contact_monitor", false)
	bullet_graphic.bullet_basic.queue_free()
	var t: Tween = create_tween()
	t.tween_interval(tween_hit_animation_time)
	t.tween_callback(self.queue_free)


func spread():
	#var offset = randf() * 360.0 / spreaded_bullet_count
	var offset = 0
	if random_angle_offset:
		offset = randf() * 360.0 / spreaded_bullet_count
	var scene = get_tree().current_scene
	for i in spreaded_bullet_count:
		var bullet = spreaded_bullet.instantiate()

		scene.call_deferred("add_child", bullet)

		var move_direction = Vector2.UP.rotated(deg_to_rad(360.0 / spreaded_bullet_count * i + offset))
		bullet.apply_central_impulse(move_direction * spreaded_bullet_speed)
		bullet.global_position = global_position


func destroy():
	queue_free()
