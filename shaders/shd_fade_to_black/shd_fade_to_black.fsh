//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float ratio;

void main()
{
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float val = (1.0- ratio);
    gl_FragColor = vec4(col.r * val, col.g * val, col.b * val, col.a);
}
