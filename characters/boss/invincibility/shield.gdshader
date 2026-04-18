shader_type canvas_item;

uniform vec4 main_color: source_color;
uniform vec4 sec_color: source_color;

uniform float stripes: hint_range(0.1, 10.0);
uniform float width: hint_range(0.0, 1.0);
uniform float speed: hint_range(-10.0, 10.0);

uniform float border: hint_range(0.0, 1.0);

void fragment() {
	float s = abs(sin((UV.x + UV.y) * 2.0 * PI * stripes + TIME * speed));
	s = step(width, s);
	
	float d = distance(UV, vec2(0.5));
	s += step(0.5 - border/2.0, d);
	
	s = min(s, 1.0);
	COLOR = mix(main_color, sec_color, s);

	COLOR.a *= 1.0 - step(0.5, d);
}
