extends Node2D

@onready var texture_rect_2: TextureRect = $"../hitbox/head/BossCentral/TextureRect2"
@onready var texture_rect: TextureRect = $"../hitbox/head/BossCentral/TextureRect"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $"../hitbox/head/CollisionShape2D"

const BOSS_GLASS_BROKEN = preload("uid://durxg3vjaq8q5")

func change():
	print("sralnik")
	texture_rect_2.visible = true
	texture_rect.visible = false
	sprite_2d.visible = true
	collision_shape_2d.global_position = sprite_2d.global_position
