
if (is_throwing) {
	sprite_index = spr_grinch_friendly_throw;
}
else {
	sprite_index = spr_grinch_friendly;
}

if (life_ticks > life_time - (11 /12)) {
	if (life_ticks < life_time - (10 /12)) {
		image_index = 0;
	}
	if (life_ticks > life_time - (1 /12)) {
		image_index = 9;
	}
	sprite_index = spr_grinch_hating_life;
}

draw_self();