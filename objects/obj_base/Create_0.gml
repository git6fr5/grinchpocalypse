
// ----------------- //
function initialize() {
	
	prev_score = 0;
	num_presents = 0;
	present_pickup_radius = 50;
	
	level = 0;
	presents_per_level = 1;
	
	num_loots_dropped = 0;
	presents_per_loot = 1;
	
	is_colliding_with_player = false;
	is_colliding_with_something_we_might_want_to_see = false
	things = [];
	thing_index = 0;
	alpha = 1;
	
}

// ----------------- //
initialize();