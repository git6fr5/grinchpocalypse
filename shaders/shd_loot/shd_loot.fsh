//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float ratio;

void main()
{
	vec4 col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float val = 0.5 + (1.0 - ratio) / 3.0;
	val = 1.0;
	col = vec4(col.b * val, col.g * val, col.r, col.a);
	
    gl_FragColor = col;
}
