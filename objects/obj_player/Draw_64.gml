//draw_set_colour(c_black);
//var hp_text = "HP: " + string(hp);
//draw_text_transformed( 0, 0, hp_text, 1.5, 1.5, 0);

//draw_set_colour(c_black);
//var ammo_text = "AMMO: " + string(primary_weapon.ammo);
//draw_text_transformed( 200, 0, ammo_text, 1.5, 1.5, 0);

//draw_set_colour(c_black);
score = 0;
for (i = 0; i < instance_number(obj_base); i += 1) {
	score += instance_find(obj_base, i).num_presents;
}
//var score_text = "SCORE: " + string(score);
//draw_text_transformed( 400, 0, score_text, 1.5, 1.5, 0);



// -------------------------------------------------------- //

var scale = display_get_gui_height() / room_height;

// show_debug_message(display_get_gui_height());

// -------------------------------------------------------- //
var present_offset_x = 2 * scale;
var present_offset_y = 8 * scale;

var grinch_w = sprite_get_width(spr_ui_grinch) * scale;
var grinch_h = sprite_get_height(spr_ui_grinch) * scale;

var hp_pos_x = (room_width - 2) * scale - grinch_w;
var hp_pos_y = (room_height - 2) * scale - grinch_h;

draw_sprite_stretched(spr_ui_grinch, 0, hp_pos_x, hp_pos_y, grinch_w, grinch_h);

//if (losing_point) {
//	var grinch_smiling = instance_create_depth(x, y, 0, obj_ui_grinch_smiling)
//	grinch_smiling.hp_pos_x = hp_pos_x;
//	grinch_smiling.present_offset_x = present_offset_x;
//	grinch_smiling.hp_pos_y = hp_pos_y;
//	grinch_smiling.present_offset_y = present_offset_y;
//	grinch_smiling.scale = scale;
//}

for (i = 0; i < max_hp; i += 1) {
	if (i == max_hp - 1) {
		
		var __w = sprite_get_width(spr_ui_hp_final_block) * scale;
		var __h = sprite_get_height(spr_ui_hp_final_block) * scale;
		
		hp_pos_x -= scale * sprite_get_width(spr_ui_hp_final_block);
		draw_sprite_stretched(spr_ui_hp_final_block, 0, hp_pos_x, hp_pos_y, __w, __h);
		hp_pos_x = hp_pos_x + scale * (sprite_get_width(spr_ui_hp_final_block) - sprite_get_width(spr_ui_hp_block)); // reset for the present drawing
	}
	else {
		var _w = sprite_get_width(spr_ui_hp_block) * scale;
		var _h = sprite_get_height(spr_ui_hp_block) * scale;
		
		hp_pos_x -= scale* sprite_get_width(spr_ui_hp_block);
		draw_sprite_stretched(spr_ui_hp_block, 0, hp_pos_x, hp_pos_y, _w, _h);
	}
	if (losing_point && i == hp) {
		// losing_point_index = 0;
		var tearing_present = instance_create_depth(x, y, 0, obj_ui_present_tearing)
		tearing_present.hp_pos_x = hp_pos_x;
		tearing_present.present_offset_x = present_offset_x;
		tearing_present.hp_pos_y = hp_pos_y;
		tearing_present.present_offset_y = present_offset_y;
		tearing_present.scale = scale;
		losing_point = false;
		
	}
	if (i < hp) {
		draw_sprite_stretched(spr_ui_present, 0, hp_pos_x + present_offset_x, hp_pos_y + present_offset_y, sprite_get_width(spr_ui_present) * scale, scale * sprite_get_width(spr_ui_present));
	}
}

var guns_alpha = 1;
if (loot_weapon != noone) {
	
	guns_alpha = 0.5;
	
	
}

// -------------------------------------------------------- //

var snowpistol_w = sprite_get_width(spr_ui_snowpistol) * scale;
var snowpistol_h = sprite_get_height(spr_ui_snowpistol) * scale;
var snowpistol_pos_x = 2 * scale;
var snowpistol_pos_y =  (room_height - 2) * scale - snowpistol_h;

draw_sprite_stretched_ext(spr_ui_snowpistol, 0, snowpistol_pos_x, snowpistol_pos_y, snowpistol_w, snowpistol_h, c_white, guns_alpha);

// -------------------------------------------------------- //

var candygun_w = sprite_get_width(spr_ui_candygun) * scale;
var candygun_h = sprite_get_height(spr_ui_candygun) * scale;

var candygun_pos_x = snowpistol_pos_x + snowpistol_w + 2 * scale;
var candygun_pos_y = (room_height - 2) * scale - candygun_h;;

draw_sprite_stretched_ext(spr_ui_candygun, 0, candygun_pos_x, candygun_pos_y, candygun_w, candygun_h, c_white, guns_alpha);

candygun_pos_x += 31 * scale;
candygun_pos_y += 11 * scale;

var ammo_percent = 1;
if (instance_exists(obj_gun_ornament)) {
	ammo_percent = obj_gun_ornament.ammo / obj_gun_ornament.max_ammo;
}
var ammo_width = sprite_get_width(spr_ui_candygun_ammo) * ammo_percent;
var ammo_height = sprite_get_height(spr_ui_candygun_ammo);

draw_sprite_part_ext(spr_ui_candygun_ammo, 0, 0, 0, ammo_width, ammo_height,candygun_pos_x, candygun_pos_y, scale, scale, c_white, guns_alpha);


if (loot_weapon != noone) {
	
	//var loot_ui_w = sprite_get_width(spr_ui_loot) * scale;
	//var loot_ui_h = sprite_get_height(spr_ui_loot) * scale;

	//var loot_ui_x = candygun_pos_x + candygun_w + 2 * scale;
	//var loot_ui_y = (room_height - 2) * scale - loot_ui_h;;

	//draw_sprite_stretched(spr_ui_loot, 0, loot_ui_x, loot_ui_y, loot_ui_w, loot_ui_h);

	//var loot_percent = max(0, 1 - loot_ticks / loot_duration);
	
	//var loot_bar_width = sprite_get_width(spr_ui_loot_bar) * loot_percent;
	//var loot_bar_height = sprite_get_height(spr_ui_loot_bar);

	//draw_sprite_part_ext(spr_ui_loot_bar, 0, 0, 0, loot_bar_width, loot_bar_height, loot_ui_x, loot_ui_y, scale, scale, c_white, 1);
}


// -------------------------------------------------------- //

if (fade_to_black) {
	shader_set(shd_fade_to_black);
	shader_params = shader_get_uniform(shd_fade_to_black, "ratio");
	var _ratio = min(1, fade_to_black_ticks / fade_to_black_interval);
	shader_set_uniform_f(shader_params, _ratio);
	draw_surface(application_surface, 0, 0);
	shader_reset();
}

else if (score >= obj_level_difficulty_setter.presents_to_win) {
	shader_set(shd_fade_to_white);
	shader_params = shader_get_uniform(shd_fade_to_white, "ratio");
	var _ratio = min(1, obj_level_difficulty_setter.win_ticks / obj_level_difficulty_setter.win_fade);
	shader_set_uniform_f(shader_params, _ratio);
	draw_surface(application_surface, 0, 0);
	shader_reset();
}
