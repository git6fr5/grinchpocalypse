
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// movement
	max_speed = 48;
	acceleration = 16;
	resistance = 0.75;
	
	// stats
	max_hp = 3;
	hp = max_hp;
	
	// trackers
	prev_hp = hp;
	losing_point_index = 0;
	losing_point = false;
	_score = 0;
	
	// weapons
	primary_weapon = instance_create_depth(x, y, -y, obj_gun_snowpistol);
	primary_weapon.is_active = true;
	
	loot_weapon = noone;
	loot_ticks = 0;
	loot_duration = 10;
	
	// presents
	has_present = false;
	present_pickup_distance = 30;
	is_targetable = true;
	present_slow = 0.75;
	
	// sprites 
	cycle_length = 8
	
	//
	low_health = false;
	fade_to_black = false;
	fade_to_black_ticks = 0;
	fade_to_black_interval = 2;
	

}

// ----------------- //
initialize();