
//---------------------//
function ai(dt) {
	think_ticks += dt;
	if (think_ticks > think_interval) {
		get_target(dt);
		think_ticks = 0;
	}
	
	life_ticks += dt;
	if (life_ticks > life_time) {
		instance_create_depth(x, y, -y, obj_zombie);
		instance_destroy();
	}
	
	if (life_ticks > 1.5 && !has_screamed) {
		// audio_play_sound_at(sfx_grinch_scream, x, y, 0, 100, 500, 1, false, 1);
		// audio_play_sound(sfx_grinch_scream, 1, false);
		has_screamed = true;
	}
	
}

function movement(dt) {
	
	if (just_spawned || is_stealing) {
		hspeed = 0;
		vspeed = 0;
	}
	else {
		//hspeed += sign(target_x - x) * acceleration * dt
		//vspeed += sign(target_y - y) * acceleration * dt
	
		//// resistance
		//vspeed *= resistance;
		//hspeed *= resistance;
		
		//// max speed
		//speed = clamp(speed, -max_speed * dt, max_speed * dt);
	
		//if (debug) {
		//	show_debug_message("Speed: " + string(speed / dt));
		//}
	}
	
	if (x == clamp(x, target_x - 1, target_x + 1) && y == clamp(y, target_y - 1, target_y + 1)) {
		steal();
	}
	
	// depth 
	depth = -y;
	
}

function steal() {
	if (!is_stealing) {
		instance_destroy(target_friendly_zombie)
		is_stealing = true;
		image_index = 0;
	}
}


//---------------------//
function main() {
	var dt = delta_time / 1000000;
	ai(dt);
	movement(dt);
}

main();