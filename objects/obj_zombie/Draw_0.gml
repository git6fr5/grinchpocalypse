
//---------------------//
function get_state() {
	
	if (frozen_level > 0) {
		sprite_index = spr_grinch_frozen;
		cycle_length = 5;
	}
	else if (grabbing_present) {
		sprite_index = spr_grinch_picking_up_present;
		cycle_length = 7;
	}
	else if (has_present) {
		sprite_index = spr_grinch_with_present;
		cycle_length = 4;
		//show_debug_message("a");
	}
	else if (is_fighting_for_present) {
		sprite_index = spr_grinch_fighting_for_present;
		if (fighting_ticks <  (7.95/12)) {
			sprite_index = spr_grinch_start_fight;
		}
		else if (fighting_ticks > max_fight_duration - (8.05/12)) {
			if (fighting_ticks < max_fight_duration - (7.05/12)){
				image_index = 0;
			}
			if (fighting_ticks > max_fight_duration - (0.95/12)){
				image_index = 6;
			}
			sprite_index = spr_grinch_end_fight;
		}
		cycle_length = 8;
	}
	else if (is_knockbacked) {
		if (snow_type_knockback) {
			sprite_index = spr_grinch_knockback; // spr_grinch_knockbacked;
		}
		else {
			sprite_index = spr_grinch_knockback_no_snow;
		}
		cycle_length = 1;
		//show_debug_message("b");
	}
	else if (is_getting_up) {
		sprite_index = spr_grinch_getting_up; // spr_grinch_knockbacked;
		cycle_length = 10;
		//show_debug_message("c");
	}
	else {
		sprite_index = spr_grinch;
		cycle_length = 4;
		//show_debug_message("d");
	}
	
}

function get_direction() {
	
	if (frozen_level > 0) {
		image_index = frozen_level - 1;
		image_index = min(4, image_index);
		return;
	}
	
	// down
	var offset = 3;
	
	if (abs(hspeed) > abs(vspeed)) {
		if (hspeed < 0) {
			// left
			offset = 2;
		}
		else {
			// right
			offset = 0;
		}
	}
	else { // yes ugly but more readable
		if (vspeed < 0) {
			// up
			// offset = 1;
		}
	}
	
	if (sprite_index == spr_grinch_getting_up) {
		// is_getting_up = false;
		// show_debuf
		if (is_sitting) {
			image_index = 0;
		}
	}
	
	if (is_fighting_for_present) {
		offset = 0;
	}
	if (grabbing_present) {
		offset = 0;
	}
	
	if (image_index < cycle_length * offset) {
		image_index = cycle_length * offset;
	}
	else if (image_index >= cycle_length * (offset + 1)) {
		// show_debug_message("wtf???");
		if (is_getting_up) {
			// show_debug_message("helloo???");
			is_getting_up = false;
		}
		if (grabbing_present) {
			grabbing_present = false;
		}
		else {
			image_index = cycle_length * offset;
			//if (!is_getting_up) {
			//show_debug_message("helloo A???");}
		}
	}
	
}

//---------------------//
function main() {
	get_state();
	get_direction();
	draw_self();
}

main();
