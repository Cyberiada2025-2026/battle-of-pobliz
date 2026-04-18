shader_type canvas_item;

uniform vec3 flash_col: source_color = vec3(1.0);
uniform float anim: hint_range(0.0, 1.0) = 1.0;

void fragment() {
	COLOR.rgb = mix(COLOR.rgb, flash_col, sqrt(1.0 - anim));
}
