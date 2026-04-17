extends Timer


@export var boss: Boss
@export var min_cooldown: float = 1
@export var max_cooldown: float = 1

func _ready() -> void:
	start()

func _on_timeout() -> void:
	boss.atack_signal.emit()
	wait_time = randf_range(min_cooldown, max_cooldown)
	start()
