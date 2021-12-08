
//---------------------//
function movement(dt) {
	
	// input
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        vspeed -= acceleration * dt;
    }
    else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        vspeed += acceleration  * dt;
    }

    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        hspeed += acceleration  * dt;
    }
    else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        hspeed -= acceleration  * dt;
    }
	
	// resistance
	vspeed *= resistance;
    hspeed *= resistance;
	
	// max speed
	var slow_factor = has_present ? present_slow : 1;
	speed = clamp(speed, -slow_factor * max_speed * dt, slow_factor * max_speed * dt);
	
	// area bounds
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
	
	// depth 
	depth = -y;
	
	if (debug) {
		show_debug_message("Speed: " + string(speed / dt));
	}
	
}

function check_present() {
	
	if (keyboard_check_pressed(vk_space)) {
		if (has_present) {
			drop_present();
		}
		else if (instance_exists(obj_present)) {
			pick_up_present();
		}
	}
	
}

function drop_present() {
	// drop present
	var present = instance_create_depth(x, y + 10, -(y+10), obj_present);
	present.is_dropped = true;
	has_present = false;
	return present;
}

function pick_up_present() {
	
	if (instance_exists(obj_present)) {
		for (i = 0; i < instance_number(obj_present); i += 1) {
			var present = instance_find(obj_present, i);
			if (present.is_targetable && distance_to_point(present.x, present.y) < present_pickup_distance) {
				instance_destroy(present);
				has_present = true;
			}
		}
	}
	
}

function switch_weapon(dt) {
	
	if (has_present) {
		if (loot_weapon != noone) {
			loot_weapon.is_active = false;
		}
		primary_weapon.is_active = false;
	}
	else {
		if (loot_weapon != noone) {
			loot_weapon.is_active = true;
			primary_weapon.is_active = false;
		}
		else {
			primary_weapon.is_active = true;
		}
	}
	
	if (loot_weapon != noone) {
		loot_ticks += dt
		if (loot_ticks > loot_duration) {
			instance_destroy(loot_weapon);
			loot_weapon = noone;
			loot_ticks = 0;
		}
		return;
	}
	
	var new_weapon = noone;
	if (mouse_check_button_pressed(mb_left)) {
		new_weapon = obj_gun_snowpistol;
	}
	else if (mouse_check_button_pressed(mb_right)) {
		new_weapon = obj_gun_ornament;
	}
	
	if (new_weapon != noone) {
		primary_weapon.is_active = false;
		if (instance_exists(new_weapon) && new_weapon.object_index == new_weapon) {
			primary_weapon = new_weapon;
			primary_weapon.is_active = true;
			primary_weapon.x = x; primary_weapon.y = y;
		}
		else {
			primary_weapon = instance_create_depth(x, y, -y, new_weapon);
			primary_weapon.is_active = true;
			primary_weapon.x = x; primary_weapon.y = y;
		}
		
		if (has_present) {
			drop_present();
		}
	}
	
}

//---------------------//
function main() {
	var dt = delta_time / 1000000;
	movement(dt);
	check_present();
	switch_weapon(dt);
	// move_bounce_solid(false);
	
}

main();