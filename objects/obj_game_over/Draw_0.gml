
alpha = 0;
if (life_ticks > init_time && life_ticks < init_time + life_time) {
	alpha = (life_ticks - init_time) / life_time;
}
else if ( life_ticks > life_time + init_time) {
	alpha = 1;
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
 
//if (life_ticks < init_time) {
//	shader_set(shd_fade_to_black);
//	shader_params = shader_get_uniform(shd_fade_to_black, "ratio");
	
//	var _ratio = min(0, 1 - (life_ticks / init_time));
	
//	shader_set_uniform_f(shader_params, _ratio);
//	draw_surface(application_surface, 0, 0);
//	shader_reset();
//}
