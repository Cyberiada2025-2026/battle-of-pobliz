shader_type canvas_item;

uniform vec3 color: source_color = vec3(1.0);
uniform float inner_radius: hint_range(0.0, 1.0) = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float dist = 1.0 - distance(UV*2.0, vec2(1.0));
	
	COLOR.rgb = color;
	COLOR.a *= step(0.0, dist) - step(1.0 - inner_radius, dist);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
