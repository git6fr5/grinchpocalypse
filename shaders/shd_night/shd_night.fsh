//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 original_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// blue filter
	float val = 0.5;
	float val_b = 0.1;
	vec4 col = original_col - vec4(val, val, val_b, 0);
	
	// accentuate the yellows
	// if r + g > b -> * 2
	//if ((col.r + col.g - col.b) / 2.0 > 0.3) {
	//	col = vec4(col.r * 1.5, col.g * 1.5, col.b, col.a);
	//}

	
    gl_FragColor = col; //
}
