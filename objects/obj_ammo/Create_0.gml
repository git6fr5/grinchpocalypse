
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// origin
	origin_x = x;
	origin_y = y;
	
	// falling
	is_falling = true;
	fall_length = room_height + 100;
	fall_distance = 0;
	if (is_falling) {	
		y -= fall_length;
	}
	fall_speed = 128;
	
	b_virtual_init = true;
	
}

// ----------------- //
initialize();