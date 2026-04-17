class_name AnimationController
extends Node

@export var animated_sprite: AnimatedSprite2D
@export var body: BodyController
## key is an expression that evaluates to true when animation is supposed to be played
## value is the name of the animation
## earlier has precedence
@export var animations: Array[ConditionalAnimation]

func _process(_delta: float) -> void:
	if not is_zero_approx(body.velocity.x):
		animated_sprite.flip_h = body.velocity.x < 0
	for conditional_anim in animations:
		var expression = Expression.new()
		var animation_condition = conditional_anim.condition
		var error = expression.parse(animation_condition)
		if error != OK:
			print(expression.get_error_text())
			return
		var result = expression.execute([], self)
		if not expression.has_execute_failed():
			if result and animated_sprite.animation != conditional_anim.animation_name:
				animated_sprite.play(conditional_anim.animation_name)
				return


