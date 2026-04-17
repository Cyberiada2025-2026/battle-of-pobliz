extends Node2D
class_name BossPhase

@export var atack_timers: Array[Timer]
@export var phase_health: float = 10
@export var bar_color: Color = Color.RED
@export var invincibility_timer: Timer

var attacks: Array[Node]

var statue_manager: StatueManager

func _ready():
	attacks = get_node("Attacks").get_children()
	statue_manager = get_tree().get_first_node_in_group("statue_manager") as StatueManager
	if invincibility_timer != null:
		invincibility_timer.timeout.connect(statue_manager.start_invincibility)
		statue_manager.statues_destroyed.connect(invincibility_timer.start)
