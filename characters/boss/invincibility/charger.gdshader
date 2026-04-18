shader_type canvas_item;

uniform vec4 main_color: source_color;
uniform vec4 sec_color: source_color;

uniform float stripes: hint_range(0.1, 10.0);
uniform float width: hint_range(0.0, 1.0);
uniform float speed: hint_range(-10.0, 10.0);


void fragment() {
	float s = abs(sin(UV.x * 2.0 * PI * stripes + TIME * speed + UV.y*0.5));
	s = step(width, s);

	COLOR = mix(main_color, sec_color, s);
}
