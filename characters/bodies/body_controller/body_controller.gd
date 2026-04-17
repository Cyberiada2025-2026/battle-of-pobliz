class_name BodyController
extends CharacterBody2D

## put controllers here in order of evaluation
@export var movement_components: Array[Node] = []

func _ready() -> void:
	for movement_comp in movement_components:
		movement_comp.body = self

func _physics_process(delta: float) -> void:
	if not get_tree().get_first_node_in_group("possession_manager").current_body == self:
		return

	for movement_comp in movement_components:
		movement_comp.apply(delta)

	move_and_slide()
