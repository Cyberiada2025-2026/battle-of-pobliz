shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform vec3 tint: source_color;
/** Warping screen along x */
uniform float warp_x: hint_range(0.0, 0.125) = 0.03125;
/** Warping screen along y */
uniform float warp_y: hint_range(0.0, 0.125) = 0.041667;

vec2 Warp(vec2 pos){
  pos = pos*2.0 - 1.0;
  pos *= vec2(1.0 + (pos.y*pos.y) * warp_x, 1.0 + (pos.x*pos.x) * warp_y);
  return pos*0.5 + 0.5;
}

void fragment() {
	vec2 pos = Warp(SCREEN_UV);
	vec3 color = texture(screen_texture, pos).rgb * tint;
	COLOR.rgb = color;
	
}
