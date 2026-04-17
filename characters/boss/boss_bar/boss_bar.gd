extends Control
class_name BossBar

@export var boss: Boss
@export var bar_base: Node

var bars: Array[PhaseBar]
var cur_bar: PhaseBar

func _ready() -> void:
	var i: int = boss.phases.size() + 1
	for phase in [boss.current_phase] + boss.phases:
		var bar = PhaseBar.new()
		bar_base.add_child(bar)
		bars.append(bar)
		bar.color = phase.bar_color
		bar.phase = phase
		bar.length = bar_base.size.x
		bar.size.y = bar_base.size.y
		bar.health = phase.phase_health
		bar.set_health(phase.phase_health)
		bar.z_index += i
		i -= 1
	cur_bar = bars.pop_front()

func _process(_delta: float) -> void:
	if cur_bar.phase != boss.current_phase:
		cur_bar.queue_free()
		print("dsfs")
		cur_bar = bars.pop_front()
	cur_bar.set_health(boss.health)
