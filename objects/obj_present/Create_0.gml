
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// origin
	origin_x = x;
	origin_y = y;
	
	// falling
	is_dropped = false;
	is_falling = true;
	fall_length = room_height + 100;
	fall_distance = 0;
	if (is_falling) {	
		y -= fall_length;
	}
	fall_speed = 64;
	
	// targetting
	is_targetable = true;
	
	// movement
	is_knockbacked = false;
	knockback_ticks = 0;
	knockback_duration = 0.25;
	knockback_vspeed = 0;
	knockback_hspeed = 0;
		
	b_virtual_init = true;	
}

// ----------------- //
initialize();