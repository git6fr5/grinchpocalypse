
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// movement
	max_speed = 32;
	acceleration = 16;
	resistance = 0.975;
	
	// knockback
	is_knockbacked = false;
	knockback_ticks = 0;
	knockback_duration = 0.35;
	knockback_resistance = 0.85;
	
	// getting up
	is_getting_up = false;
	is_fighting_for_present = false;
	fighting_ticks = 0;
	max_fight_duration = 7;
	
	// ai
	think_interval = 0.25;
	think_ticks = 0;
	grabbing_present = false;
	has_present = false;
	y_offset = 6; // always due to pivot
	x_offset = 14; // for animations
	side = 1;
	target_zombie = noone;
	// target_present = noone;
	get_target();
	
	// stats
	anger = 0;
	friendly_threshold = -5;
	angry_threshold = 5;
	present_slow = 0.5;
	
	// sprites
	cycle_length = 4;

}

function get_target() {
	
	if (is_fighting_for_present) { return; }
	
	target_x = random_range(0, room_width);
	target_y = random_range(0, room_height);
	target_zombie = noone;
	target_present = noone;
	
	var distance = infinity;
	
	if (instance_exists(obj_present)) {
		var present = instance_nearest(x, y, obj_present);
		
		if (present.is_targetable) {
			target_x = present.x;
			target_y = present.y;
			distance = 	distance_to_point(present.x, present.y);
		}
		else {
			for (i = 0; i < instance_number(obj_present); i += 1) {
				present = instance_find(obj_present, i);
				if (present.is_targetable && distance_to_point(present.x, present.y) < distance) {
					target_x = present.x;
					target_y = present.y;
					distance = distance_to_point(present.x, present.y);
				}
			}
		}
		target_present = present;
	}
	
	if (distance_to_point(obj_player.x, obj_player.y) < distance) {
		if (obj_player.has_present) {
			target_x = obj_player.x;
			target_y = obj_player.y;
			distance = distance_to_point(obj_player.x, obj_player.y);
		}
	}
	
	for (i = 0; i < instance_number(obj_zombie); i += 1) {
		var zombie = instance_find(obj_zombie, i);
		if (zombie.has_present && distance_to_point(zombie.x, zombie.y) < distance) {
			target_x = zombie.x - x_offset * side;;
			target_y = zombie.y;
			target_zombie = zombie;
			distance = distance_to_point(zombie.x, zombie.y);
		}
	}
	
	target_y += 6;
	
}

// ----------------- //
initialize();