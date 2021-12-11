
// ----------------- //
function get_level() {
	level = floor( num_presents / presents_per_level );
	image_index = min(3, level);
}

// ----------------- //
function main() {
	get_level();
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
}

main();

if (room_get_name(room) != "room_endless") {
	var __w = sprite_get_width(spr_ui_progress_bar);
	var __h = sprite_get_height(spr_ui_progress_bar);

	//var candygun_pos_x = snowpistol_pos_x + snowpistol_w + 2 * scale;
	//var candygun_pos_y = (room_height - 2) * scale - candygun_h;;

	draw_sprite_ext(spr_ui_progress_bar, 0, x -19, y + 30,1, 1,0,c_white, 0.75);

	var percent = score / obj_level_difficulty_setter.presents_to_win;
	var fill_width = sprite_get_width(spr_ui_progress_bar_fill) * percent;
	var fill_height = sprite_get_height(spr_ui_progress_bar_fill);

	draw_sprite_part_ext(spr_ui_progress_bar_fill, 0, 0, 0, fill_width, fill_height, x - 19, y + 30, 1, 1, c_white, 0.75);
}
else {
	draw_set_alpha(1);

	draw_set_halign(fa_left);
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_text(x , y+ 30, string(score));
}