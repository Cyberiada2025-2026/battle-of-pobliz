class_name PossessionManager
extends Node

@export var current_body: BodyController
@export var player_camera: Camera2D

func _ready() -> void:
	posses_body(current_body)

func posses_body(body: BodyController) -> void:
	current_body = body
	player_camera.reparent(current_body)


