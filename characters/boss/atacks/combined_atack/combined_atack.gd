extends Node

@export var atacks: Array[Node]

func use() -> void:
	for atack in atacks:
		atack.use()
