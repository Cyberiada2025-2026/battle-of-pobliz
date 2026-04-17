shader_type canvas_item;

uniform float radius: hint_range(0.0, 5.0) = 1.0;

uniform vec3 color_main: source_color = vec3(0.6, 0.1, 0.1);
uniform vec3 color_outline: source_color = vec3(1.0, 0.8, 0.8);
uniform vec3 color_center: source_color = vec3(1.0);
uniform vec3 color_rings: source_color = vec3(0.8, 0.3, 0.3);

uniform float outline_thickness: hint_range(0.0, 1.0) = 0.05;
uniform float center_size: hint_range(0.0, 1.0) = 0.1;

uniform float ring_thickness: hint_range(0.0, 1.0) = 0.2;
uniform float ring_speed: hint_range(-20.0, 20.0) = 1.0;
uniform float ring_amount: hint_range(0, 10, 1.0) = 2;

void vertex() {
	VERTEX *= radius;
}

void fragment() {
	float dist = 1.0 - distance(UV*2.0, vec2(1.0));
	vec3 col = color_main;
	
	float rings = dist * PI * ring_amount;
	rings = abs(sin(rings + TIME * ring_speed));
	rings = step(1.0 - ring_thickness, rings);
	col = mix(col, color_rings, rings);
	
	col = mix(col, color_outline, 1.0 - step(outline_thickness, dist));
	col = mix(col, color_center, step(1.0 - center_size, dist));
	
	COLOR.rgb = col;
	COLOR.a = step(0.0, dist);
}