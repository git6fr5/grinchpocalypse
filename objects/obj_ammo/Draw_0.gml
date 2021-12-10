
var alpha = 0.5;
if (!is_falling) {
	image_index = 0;
	alpha = 1;
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);