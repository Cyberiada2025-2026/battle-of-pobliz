class_name Bullet
extends RigidBody2D

@export var damageComponent: Node
@export var bullet_graphic: BulletGraphic
@export var tween_hit_animation_time: float = 0.4
@export var bounces: int = 0
@export var timeout: float = -1


func _ready() -> void:
	# rotate graphic
	bullet_graphic.bullet_shot.emitting = true


func _process(delta: float) -> void:
	if timeout < 0:
		return
	timeout -= delta
	if timeout < 0:
		destroy_with_animation()

func _on_body_entered(body: Node) -> void:
	if (body is Platform or body is TileMapLayer) and bounces > 0:
		bounces -= 1
		return

	destroy_with_animation()


func destroy_with_animation():
	bullet_graphic.bullet_hit.emitting = true
	call_deferred("set_contact_monitor", false)
	bullet_graphic.bullet_basic.queue_free()
	var t: Tween = create_tween()
	t.tween_interval(tween_hit_animation_time)
	t.tween_callback(self.queue_free)

func destroy():
	queue_free()
