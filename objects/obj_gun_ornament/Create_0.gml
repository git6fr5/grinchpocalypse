
// ----------------- //
function initialize() {
	
	// debug
	debug = true;
	
	// stats
	is_active = false;
	offset = 10;
	dir_x = 0;
	dir_y = 0;
	
	// firing
	// fire_amount = 3;
	bullet = obj_bullet_ornament;
	fire_rate = 0.15;
	fire_ticks = 0;
	
	fire_sound = sfx_gun_ornament; //slingshot;
	
	// muzzle
	muzzle_length = 10;
	muzzle_offset_x = 0;
	muzzle_offset_y = 0;
	
	// ammo
	max_ammo = 25;
	ammo = max_ammo;
	
	button = mb_right;
	
	if (debug) {
		show_debug_message("Initialized a gun");
	}
	
}

// ----------------- //
initialize();