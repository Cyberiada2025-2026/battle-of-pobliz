extends Node2D
class_name BossPhase

@export var atack_timers: Array[Timer]
@export var phase_health: float = 10
@export var bar_color: Color = Color.RED

var attacks: Array[Node]

func _ready():
	attacks = get_node("Attacks").get_children()
