extends Area2D

@export var body: BodyController

func collided(node: Node2D) -> void:
	if get_tree().get_first_node_in_group("possession_manager").current_body == body:
		body.take_damage(node.damageComponent.get_damage())
