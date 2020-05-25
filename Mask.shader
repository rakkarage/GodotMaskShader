shader_type canvas_item;

uniform vec4 color: hint_color;
uniform sampler2D mask: hint_albedo;
uniform float scale = 2.0;
const float pivot = 0.5;

void fragment() {
	COLOR.rgb = color.rgb;

	float x = SCREEN_PIXEL_SIZE.x;
	float y = SCREEN_PIXEL_SIZE.y;
	vec2 ratio = vec2(1, 1);
	if (x > y)
		ratio = vec2(1, x / y);
	else if (y > x)
		ratio = vec2(y / x, 1);

	COLOR.a = 1.0 - texture(mask, (UV - pivot) * scale * ratio + pivot).a;
}