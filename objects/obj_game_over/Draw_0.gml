
alpha = 0;
if (life_ticks > init_time && life_ticks < init_time + life_time) {
	alpha = (life_ticks - init_time) / life_time;
}
else if ( life_ticks > life_time + init_time) {
	alpha = 1;
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
 