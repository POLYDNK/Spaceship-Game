//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 v_rgbColor;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(v_rgbColor.r, v_rgbColor.g, v_rgbColor.b, gl_FragColor.a);
}
