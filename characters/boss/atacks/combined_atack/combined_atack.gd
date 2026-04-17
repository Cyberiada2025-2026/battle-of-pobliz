extends Node

@export var atacks: Array[Node]

func use() -> void:
	print("COMBINED ATACK")
	for atack in atacks:
		atack.use()
