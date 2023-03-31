//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	float darkenPercent = 0.3;
	vec4 v_vNewColor = v_vColour * darkenPercent;
	v_vNewColor.a = 1.0;
	
    gl_FragColor = v_vNewColor * texture2D( gm_BaseTexture, v_vTexcoord );
}
