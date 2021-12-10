
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// pathing
	// mp_potential_settings(45, 5, 100, true);
	path = path_add();
	// mp_potential_settings(5, 90, 10, false)
	path_precision = 4;
	path_depth = 4;
	origin_x = x;
	origin_y = y;
	
	// movement
	max_speed = 20;
	acceleration = 5;
	resistance = 0.975;
	
	// knockback
	is_knockbacked = false;
	knockback_ticks = 0;
	knockback_duration = 0.35;
	knockback_resistance = 0.85;
	knockback_vspeed = 0;
	knockback_hspeed = 0;
	
	snow_type_knockback = false;
	
	// getting up
	is_getting_up = false;
	is_fighting_for_present = false;
	fighting_ticks = 0;
	max_fight_duration = 7;
	
	is_sitting = false;
	sitting_ticks = 0;
	sitting_duration = 1;
	
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
	friendly_threshold = -3;
	angry_threshold = 3;
	present_slow = 0.5;
	
	// sprites
	cycle_length = 4;
	
	// 
	is_laughing = false;
	laughing_ticks = 0;
	laugh_interval = 1;
	laughs = [sfx_grinch_happy_1, sfx_grinch_happy_2, sfx_grinch_happy_3, sfx_grinch_happy_4, sfx_grinch_happy_5, sfx_grinch_happy_6]

	// freeze
	frozen_level = 0;
	frozen_interval = 3;
	frozen_ticks = 0;

}

function get_target(dt = 0) {
	
	if (is_fighting_for_present || is_knockbacked || is_getting_up) { 
		path_end();
		return; 
	}
	
	target_x = random_range(0, room_width);
	target_y = random_range(0, room_height);
	
	target_zombie = noone;
	target_present = noone;
	target_person = noone;
	
	var distance = infinity;
	
	if (distance_to_point(obj_player.x, obj_player.y) < distance) {
		if (obj_player.has_present) {
			target_x = obj_player.x;
			target_y = obj_player.y;
			distance = distance_to_point(obj_player.x, obj_player.y);
		}
		
		target_person = obj_player;
	}
	
	if (instance_exists(obj_present)) {
		for (i = 0; i < instance_number(obj_present); i += 1) {
			present = instance_find(obj_present, i);
			if (present.is_targetable && distance_to_point(present.x, present.y) < distance) {

				target_x = present.x;
				target_y = present.y;
				
				distance = distance_to_point(present.x, present.y);
				target_person = noone;
				target_present = present;
				
			}
		}
		
	}
	
	if (instance_exists(obj_zombie)) {
		for (i = 0; i < instance_number(obj_zombie); i += 1) {
			var zombie = instance_find(obj_zombie, i);
			
			// move towards zombies with presents
			if (zombie.has_present && distance_to_point(zombie.x, zombie.y) < distance) {
				side = sign(x - zombie.x);
				target_x = zombie.x + x_offset * side;;
				target_y = zombie.y;
				
				distance = distance_to_point(zombie.x, zombie.y);
				target_person = noone;
				target_present = noone;
				target_zombie = zombie;
			}
			
			else if (!zombie.has_present && zombie != self && distance > 15) {
				if (distance_to_point(zombie.x, zombie.y) > 5 && distance_to_point(zombie.x, zombie.y) < 15) {
					
					target_x = x + 15 * sign(x - zombie.x);
					target_y = y + 15 * sign(y - zombie.y);
					
					distance = distance_to_point(zombie.x, zombie.y);
					target_person = noone;
					target_present = noone;
					target_zombie = zombie;
				}
			}
		}
		
		//var closest_zomb = instance_nearest(x, y, obj_zombie);
		//if (!closest_zomb.has_present && distance_to_point(closest_zomb.x, closest_zomb.y) < 50) {
		//	target_x = zombie.x + sign(x - zombie.x) * 50;
		//	target_y = zombie.y + sign(y - zombie.y) * 50;
			
		//	target_person = noone;
		//	target_present = noone;
		//	target_zombie = noone;
		//}
		
	}
	
	
	// target_y += 8;
	
	if (has_present) {			
		var center_x = room_width / 2;
		var center_y = room_height / 2;
		
		//target_x = x + 100 * (x - center_x);
		//target_y = y + 100 * (y - center_y);
		
		target_x = origin_x;
		target_y = origin_y;
	
	}
	
	//var slow_factor = has_present ? present_slow : 1;
	
	//var _speed = slow_factor * max_speed * dt;
	//path_end();
	//mp_potential_path(path, target_x, target_y, path_precision, path_depth, false);
	//path_start(path, _speed, path_action_stop, false);
	
}

// ----------------- //
initialize();
