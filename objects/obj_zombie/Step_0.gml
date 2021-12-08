
//---------------------//
function ai(dt) {
	
	think_ticks += dt;
	if (think_ticks > think_interval) {
		get_target(dt);
		think_ticks = 0;
	}
	
	if (is_knockbacked) {
		path_end();
	}
	
	if (is_knockbacked && is_fighting_for_present) {
		is_fighting_for_present = false
		has_present = false
		
		var present = instance_create_depth(x, y, -y, obj_present);
		present.is_dropped = true;
		
		var new_zombie = instance_create_depth(x, y, -y, obj_zombie);
		if (abs(hspeed) > abs(vspeed)) {
			new_zombie.hspeed = -vspeed;
			new_zombie.vspeed = -hspeed;
		}
		else {
			new_zombie.hspeed = -vspeed;
			new_zombie.vspeed = hspeed;
		}
		var temp = hspeed;
		hspeed = vspeed;
		vspeed = temp;
		new_zombie.is_knockbacked = true;
	}
	
	if (is_knockbacked && grabbing_present) {
		grabbing_present = false;
	}
	
	if (is_fighting_for_present) {
		fighting_ticks += dt;
		if (fighting_ticks > max_fight_duration) {
			
			var new_zombie = instance_create_depth(x + side * x_offset, y, -y, obj_zombie);
			new_zombie.has_present = false;
			new_zombie = instance_create_depth(x, y, -y, obj_zombie);
			new_zombie.has_present = false;
			has_present = false;
			instance_destroy();
			fighting_ticks = 0;
			
			obj_player.hp -= 1;
		}
	}
	else {
		fighting_ticks = 0;
	}
	
}

function collision() {
	
	// leaving room
	if ( has_present ){
		if ((x < 0 || x > room_width) && y < 0 || y > room_height) {
			// take a point off the player.
			obj_player.hp -= 1;
			instance_destroy();
		}
	}
	
	
	if (y == clamp(y, target_y - 1, target_y + 1) && x == clamp(x, target_x - 1, target_x + 1)) {
		
		// hitting a person
		if (target_person != noone) {
			if (!has_present && !is_knockbacked && target_person.is_targetable) {
				if (target_person.has_present) {
					target_person.has_present = false;
					has_present = true;
					// target_person.drop_present();
				}
			}
		}
		
		// hitting a zombie
		if (target_zombie != noone && instance_exists(target_zombie)) {
			if (!has_present && !is_fighting_for_present && target_zombie.has_present) {
				target_zombie.has_present = false;
				instance_destroy(target_zombie)
				is_fighting_for_present = true;
				image_index = 0;
			}
		}
		
		// hitting a present
		if (target_present != noone  && instance_exists(target_present)) {
			show_debug_message("reached a present");
			if (!has_present && !is_knockbacked && target_present.is_targetable) {
				has_present = true;
				grabbing_present = true;
				// target_present.is_targetable = false;
				instance_destroy(target_present);
				image_index = 0;
			}
		}
		
	}
	
}

function movement(dt) {
	
	if (is_knockbacked) {
		knockback_ticks += dt;
		if (knockback_ticks > knockback_duration) {
			is_knockbacked = false;
			// is_getting_up = true;
			knockback_ticks = 0;
		}
		
		// resistance
		knockback_hspeed *= knockback_resistance;
		knockback_vspeed *= knockback_resistance;
		
		hspeed = knockback_hspeed;
		vspeed = knockback_vspeed;
		
		// move_bounce_solid(true);
	
	}
	else if (is_getting_up) {
		vspeed = 0;
		hspeed = 0;
	}
	else if (grabbing_present) {
		vspeed = 0;
		hspeed = 0;
	}
	else {
		
		hspeed += sign(target_x - x) * acceleration * dt
		vspeed += sign(target_y - y) * acceleration * dt
	
		// resistance
		vspeed *= resistance;
	    hspeed *= resistance;
		
		// max speed
		var slow_factor = has_present ? present_slow : 1;
		speed = clamp(speed, -slow_factor * max_speed * dt, slow_factor * max_speed * dt);
		
	}
	
	// var slow_factor = has_present ? present_slow : 1;
	// path_speed = slow_factor * max_speed * dt;
	
	// depth 
	depth = -y;
	
	if (debug) {
		show_debug_message("Speed: " + string(speed / dt));
	}
	
}

function state() {
	
	if (anger <= friendly_threshold && !is_knockbacked) {
		// die
		instance_create_depth(x, y, -y, obj_zombie_friendly)
		instance_destroy();
	}
	if (anger >= angry_threshold && !is_knockbacked) {
		instance_create_depth(x, y, -y, obj_zombie_angry)
		instance_destroy();
	}
	
}

function audio(dt) {
	
	if (is_laughing) {
		laughing_ticks += dt;
		if (laughing_ticks > laugh_interval) {
			is_laughing = false;
			laughing_ticks = 0;
		}
	}

	if (has_present && !is_laughing) {
		var index = random_range(0, 5.95);
		if (!audio_is_playing(laughs[index])) {
			audio_play_sound_at(laughs[index], x, y, 0, 100, 500, 1, false, 1);
			// if (!audio_is_playing(ambient_laughs[index])) {
			is_laughing = true;
		}
	}
	
}

//---------------------//
function main() {
	var dt = delta_time / 1000000;
	ai(dt);
	collision();
	movement(dt);
	audio(dt);
	state();
}

main();