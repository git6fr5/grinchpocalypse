depth = -2*room_height;
if (escape_level == 0) {
	sprite_index = spr_ui_exit_button;
	x = room_width - sprite_get_width(sprite_index);
	y = 0;
}
else if (escape_level == 1) {
	sprite_index = spr_ui_exit;
	x = room_width/2;
	y = room_height /2
}

draw_self();