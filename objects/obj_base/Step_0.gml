
// ----------------- //
function check_for_presents() {
	
	num_presents = 0;
	for (i = 0; i < instance_number(obj_present); i += 1) {
		var present = instance_find(obj_present, i);
		if (!present.is_falling && !present.is_dropped) {
			var diff_x = present.x - x;
			var diff_y = present.y - y;
			var dist = diff_x * diff_x + diff_y * diff_y;
			if (dist < present_pickup_radius * present_pickup_radius) {
				// pick up the present
				// instance_destroy(present);
				num_presents += 1;
			}
		}
	}
	
	if (num_presents >= (num_loots_dropped + 1) * presents_per_loot) {
		// drop loot
		var x_offset = random_range(-50, 50);
		var y_offset = random_range(50, 100);
	
		instance_create_depth(x + x_offset, y + y_offset, -(y + y_offset), pick_loot());
		num_loots_dropped += 1;
	}
	
	if (num_presents > prev_score) {
		audio_play_sound(sfx_score_point, 1, 0);
	}
	prev_score = num_presents;

}

function pick_loot() {
	
	var loot_list = [obj_loot, obj_loot_popper, obj_loot_candycane];
	var loot_index = floor(random_range(0, 2.99));
	return loot_list[loot_index];
	
}
	

// ----------------- //
function main() {
	check_for_presents();
	depth = -(y + 16);
}

main();