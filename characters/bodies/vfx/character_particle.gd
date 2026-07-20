extends GPUParticles2D

@export var sprite: AnimatedSprite2D
@export var mat: ParticleProcessMaterial

var check: bool = true;

func _process(delta: float) -> void:
	if check == sprite.flip_h:
		print("!!!!")
		check = !check
		mat.direction.x *= -1.0
