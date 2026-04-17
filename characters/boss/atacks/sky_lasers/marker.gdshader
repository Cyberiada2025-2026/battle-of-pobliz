shader_type canvas_item;

uniform vec3 color: source_color;
uniform float alp: hint_range(0.0, 1.0);
uniform float border_width: hint_range(0.0, 1.0) = 0.2;
uniform float width: hint_range(0.0, 1.0) = 0.2;
uniform float amount: hint_range(1.0, 100.0, 1.0);
uniform float speed;

void fragment() {
	COLOR.rgb = color;
	float alpha = 1.0 - step(0.05, UV.y);
	alpha += 1.0 - step(0.05, 1.0 - UV.y);
	
	alpha += step(1.0 - border_width, abs(UV.x - 0.5)*2.0);
	
	alpha += step(width, 1.0 - abs(sin(UV.y * 2.0 * PI * amount + UV.x*2.0 + TIME*speed)));
	
	alpha = min(alpha, 1.0);
	
	alpha *= alp;
	COLOR.a = alpha;
}

