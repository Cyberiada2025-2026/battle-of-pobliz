shader_type canvas_item;

uniform float width: hint_range(0.0, 1.0) = 0.1;
uniform float wiggles: hint_range(0.0, 1.0) = 0.1;
uniform float animation: hint_range(0.0, 1.0) = 0.0;

void fragment() {
	float anim = animation * (1.0 + width);
	float alpha = 1.0 - step(anim, UV.x);
	alpha *= step(anim - width, UV.x);
	
	float alpha0 = 1.0;
	float sine = abs(sin(UV.x  * 2.0 * PI * 2.0));
	alpha0 = 1.0 - step(sine, (UV.y - 0.5)*2.0);
	alpha0 *= step(sine - wiggles, (UV.y - 0.5)*2.0);
	
	float alpha1 = 1.0 - step(sine, -(UV.y - 0.5)*2.0);
	alpha1 *= step(sine - wiggles, -(UV.y - 0.5)*2.0);
	
	alpha *= alpha0 + alpha1;
	
	COLOR.a = alpha;

}