class_name Bullet
extends RigidBody2D

@export var damageComponent: Node
@export var bullet_graphic: BulletGraphic
@export var tween_hit_animation_time: float = 0.4

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
