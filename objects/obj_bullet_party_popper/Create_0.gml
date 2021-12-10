
// ----------------- //
function initialize() {
	
	// sprite
	bullet_index = random_range(0, 5);
	spin_magnitude = 10;
	
	// stats.
	bullet_speed = 192;
	
	// bullet_kickback = 5; // get this from the gun.
	damage = 0;
	knockback_speed = 256;
	
	impact_sound = sfx_snowball_hit;
	
	life_ticks = 0;
	init_ticks = 0.075;
	init = false;
	virtual_initialized = false;
	
	player_fired = true;
	fire_direction_x = 0;
	fire_direction_y = 0;
	
	snow_type = true;
	
	_gravity = -10;
	frags = 60;
	frag_life = 1;
	frag_min_speed = 64;
	frag_max_speed = 192;
	
	target_x = mouse_x - view_xview[0];
	target_y = mouse_y - view_xview[0];
	
	
}

// ----------------- //
initialize();
