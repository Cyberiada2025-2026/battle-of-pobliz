extends Node2D
class_name Boss

signal atack_signal

@export var death_scene: PackedScene

@export_category("nodes")
@export var canon_left: Node2D
@export var canon_right: Node2D
@export var head: Node2D

@export_category("Phases")
@export var phases: Array[BossPhase]

var int_phase = 1

var current_phase: BossPhase
var health: float = 0

func _ready() -> void:
	start_phase(phases.pop_front())


func take_damage(damage: float) -> void:
	health -= damage
	print(health)
	if health <= 0:
		if phases.is_empty():
			win()
		else:
			int_phase += 1
			SoundtrackController.current_boss_phase = int_phase
			start_phase(phases.pop_front())

func win() -> void:
	get_tree().change_scene_to_packed(death_scene)

func _on_atack_signal() -> void:
	random_atack()


func random_atack() -> void:
	var atack_set = current_phase.attacks
	var atack = atack_set.pick_random()
	atack_set.erase(atack)
	if atack == null:
		print("NO ATACK IN SET")
	else:
		await atack.use()
	atack_set.append(atack)


func start_phase(phase: BossPhase) -> void:
	print(phase.name)
	if current_phase != null:
		for timer in current_phase.atack_timers:
			timer.stop()
	current_phase = phase
	for timer in phase.atack_timers:
		timer.start()
	health = phase.phase_health
