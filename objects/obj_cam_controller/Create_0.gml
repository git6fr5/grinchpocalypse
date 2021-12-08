
// ----------------- //
function initialize() {
	
	scale_x = 1;
	scale_y = 0.5;
	
	view_x = camera_get_view_x(view_camera[0]);
	view_y = camera_get_view_y(view_camera[0]);
	
	shake = false;
	shake_ticks = 0;
	shake_duration = 0.1;
	shake_magnitude = 2;
	
	
	ambient_walks = [sfx_ambient_walk_mid, sfx_ambient_walk_left, sfx_ambient_walk_right];
	ambient_laughs = [sfx_ambient_laugh_1, sfx_ambient_laugh_2, sfx_ambient_laugh_3];
	audio_play_sound(sfx_ambient_snow, 0, true);

	virtual_init = true;
}

// ----------------- //
initialize();