shader_type canvas_item;

uniform vec3 main_col: source_color;
uniform vec3 sec_col: source_color;
uniform float core = 0.3;
uniform float alp: hint_range(0.0, 1.0) = 1.0;

void vertex() {
	VERTEX += 3.0 * vec2(sin(TIME * 2765.87), sin(TIME*1437.23));
}

void fragment() {
	float s = 0.0f;
	s = step(core, abs(UV.x - 0.5)*2.0);
	float s1 = step(0.4, abs(sin(abs(UV.x - 0.5)*2.0 * 3.0 - TIME * 10.0)));
	s = min(s, s1);
	COLOR.rgb = mix(main_col, sec_col, 1.0 - s);
	COLOR.a = alp;
}
