extends Control
class_name BossBar

@export var boss: Boss
@export var bar_base: Node

var bars: Array[PhaseBar]

func _ready() -> void:
	for phase in boss.phases:
		var bar = PhaseBar.new()
		bar_base.add_child(bar)
		bar.color = phase.bar_color
