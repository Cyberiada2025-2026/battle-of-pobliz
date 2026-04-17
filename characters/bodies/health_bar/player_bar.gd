extends Control


@export var bar_base: Node
@export var bar: Node

var cur_health
var health
var length

func _process(_delta: float) -> void:
	var body = get_tree().get_first_node_in_group("possession_manager").current_body
	if Input.is_action_just_pressed("debug_die"):
		body.health -= 1
	var h = body.health
	if h <= 0:
		body.zero_health.emit()
	set_health(h)

func _ready() -> void:
	length = bar_base.size.x
	bar.size.y = bar_base.size.y
	health = get_tree().get_first_node_in_group("possession_manager").current_body.health
	set_health(health)

func set_health(boss_health: float) -> void:
	cur_health = boss_health
	bar.size.x = length * (cur_health/health)
