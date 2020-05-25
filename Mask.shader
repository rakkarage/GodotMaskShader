shader_type canvas_item;

uniform vec4 color: hint_color;
uniform sampler2D mask: hint_albedo;
uniform float scale = 2.0;
const float pivot = 0.5;

vec2 ratio(vec2 ps) {
	return (ps.x > ps.y) ? vec2(1, ps.y / ps.x) : vec2(ps.x / ps.y, 1);
}

void fragment() {
    COLOR.rgb = color.rgb;
	vec2 ps = SCREEN_PIXEL_SIZE;
    COLOR.a = 1.0 - texture(mask, (UV - pivot) * scale * ratio(SCREEN_PIXEL_SIZE) + pivot).a;
}
