extends ColorRect
class_name PhaseBar

var health: float = 0
var cur_health: float = 0
var length: float = 0
var phase: BossPhase

func set_health(boss_health: float) -> void:
	cur_health = boss_health
	size.x = length * (cur_health/health)
