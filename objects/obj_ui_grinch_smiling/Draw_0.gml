
alpha = 1 - life_ticks / life_time;
scale = life_ticks / life_time;
draw_sprite_ext(sprite_index, image_index, x, y, 1 + scale, 1 + scale, 0, c_white, alpha)