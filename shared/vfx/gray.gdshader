shader_type canvas_item;

uniform float on: hint_range(0.0, 1.0) = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = COLOR;
	float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	COLOR = vec4(mix(color.rgb, vec3(gray), on), color.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
