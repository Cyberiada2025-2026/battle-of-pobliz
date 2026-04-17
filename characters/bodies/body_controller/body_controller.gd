class_name BodyController
extends CharacterBody2D

signal zero_health

## put controllers here in order of evaluation
@export var movement_components: Array[Node] = []
@export var health: float = 10
@export var lose_scene: PackedScene = load("res://scenes/death_screan/death_screen.tscn")
@export var sprite: AnimatedSprite2D
@export var immediate_kill: Array[Node2D]
@export var explosion: GPUParticles2D

@export var dash_comp: DashComponent
@export var type: String = ""

func _ready() -> void:
	zero_health.connect(_on_zero_health)
	for movement_comp in movement_components:
		movement_comp.body = self

func _physics_process(delta: float) -> void:
	if not get_tree().get_first_node_in_group("possession_manager").current_body == self:
		return

	for movement_comp in movement_components:
		movement_comp.apply(delta)

	move_and_slide()

func take_damage(damage: float) -> void:
	if dash_comp != null and dash_comp.is_dashing_invis:
		return
	health -= damage
	if health <= 0:
		zero_health.emit()



func _on_zero_health() -> void:
	MainMenu.body_c -= 1
	if get_tree().get_first_node_in_group("possession_manager").current_body == self:
		get_tree().call_deferred("change_scene_to_packed", lose_scene)
	else:
		sprite.visible = false
		explosion.restart()
		explosion.emitting = true
		for node in immediate_kill:
			node.queue_free()
		await get_tree().create_timer(2.0).timeout
		queue_free()
