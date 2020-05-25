	shader_type canvas_item;

	uniform vec4 color: hint_color;
	uniform sampler2D mask: hint_albedo;
	uniform float scale = 2.0;
	const float pivot = 0.5;

	void fragment() {
		COLOR.rgb = color.rgb;
		vec2 ps = SCREEN_PIXEL_SIZE;
		vec2 ratio = vec2(fract(ps.y / ps.x), fract(ps.x / ps.y));
		COLOR.a = 1.0 - texture(mask, (UV - pivot) * scale * ratio + pivot).a;
	}