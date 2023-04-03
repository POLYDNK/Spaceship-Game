//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 v_shieldColor;

void main()
{
	// Set fragment color to value from texture + color input
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Set fragment color to shield color, multiply the alpha by that of the texture
	gl_FragColor = vec4(v_shieldColor.r, v_shieldColor.g, v_shieldColor.b, gl_FragColor.a * v_shieldColor.a);
}
