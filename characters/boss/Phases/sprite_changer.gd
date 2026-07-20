extends Node2D

@onready var ship_glass_broken: TextureRect = $"../hitbox/head/BossCentral/TextureRect2"
@onready var ship_glass: Sprite2D = $"../hitbox/head/BossCentral/Sprite2D"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var shield_central: Sprite2D = $"../Shields/Central"
@onready var collision_shape_2d: CollisionShape2D = $"../hitbox/head/CollisionShape2D"

const BOSS_GLASS_BROKEN = preload("uid://durxg3vjaq8q5")

func change():
	print("sralnik")
	ship_glass_broken.visible = true
	ship_glass.visible = false
	sprite_2d.visible = true
	shield_central.global_position = sprite_2d.global_position
	collision_shape_2d.global_position = sprite_2d.global_position
