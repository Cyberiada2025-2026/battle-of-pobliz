extends GPUParticles2D

@export var spread: float = 40;

var process_mat: ParticleProcessMaterial

func _ready() -> void:
	process_mat = process_material

func _process(delta: float) -> void:
	process_mat.angle_min = -global_rotation_degrees - spread
	process_mat.angle_max = -global_rotation_degrees + spread
