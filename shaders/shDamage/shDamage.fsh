//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D DamageTexture;

void main()
{
	vec4 base_tex = texture2D( gm_BaseTexture, v_vTexcoord);
	vec4 dmg_tex = texture2D( DamageTexture, v_vTexcoord);

    gl_FragColor = v_vColour * vec4(base_tex.r + dmg_tex.r,
									base_tex.g + dmg_tex.g,
									base_tex.b + dmg_tex.b,
									base_tex.a);;
}
