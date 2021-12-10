
//---------------------//
function get_state() {
	
	if (has_present) {
		sprite_index = spr_player_with_present;
	}
	else {
		sprite_index = spr_player;
	}
	
}

function get_direction() {
	
	var offset = 0;
	
	if (abs(hspeed) > abs(vspeed)) {
		if (hspeed < 0) {
			// offset = 3;
			offset = 1;
		}
		else {
			offset = 1;
		}
	}
	else { // yes ugly but more readable
		if (abs(vspeed) < 0) {
			//offset = 2;
			offset = 0;
		}
	}
	
	if (image_index < cycle_length * offset) {
		image_index = cycle_length * offset;
	}
	else if (image_index >= cycle_length * (offset + 1)) {
		image_index = cycle_length * offset;
	}
	
	var threshold = 0.01;
	if (abs(hspeed) + abs(vspeed) < threshold) {
		image_index = cycle_length * offset;
	}
	
}

function get_direction_2() {
	
	var threshold = 0.01;
	if (abs(hspeed) + abs(vspeed) < threshold) {
		image_index = 0;
	}

}

//---------------------//
function main() {
	get_state();
	// get_direction();
	get_direction_2();
	if (loot_weapon == noone) {
		draw_self();
	}
	else {
		shader_set(shd_loot);
		shader_params = shader_get_uniform(shd_loot, "ratio");
		var _ratio = max(0, 1 - loot_ticks / loot_duration);
		shader_set_uniform_f(shader_params, _ratio);
		draw_self();
		shader_reset();
	}

}

main();

if (loot_weapon != noone) {
	
	var scale = 1;
	var loot_ui_w = sprite_get_width(spr_ui_loot);
	var loot_ui_h = sprite_get_height(spr_ui_loot);

	var loot_ui_x = x - 19;
	var loot_ui_y = y + 2;

	draw_sprite_stretched_ext(spr_ui_loot, 0, loot_ui_x, loot_ui_y, loot_ui_w, loot_ui_h, c_white, 0.75);

	var loot_percent = max(0, 1 - loot_ticks / loot_duration);
	
	var loot_bar_width = sprite_get_width(spr_ui_loot_bar) * loot_percent;
	var loot_bar_height = sprite_get_height(spr_ui_loot_bar);

	draw_sprite_part_ext(spr_ui_loot_bar, 0, 0, 0, loot_bar_width, loot_bar_height, loot_ui_x, loot_ui_y, scale, scale, c_white, 0.75);

}

