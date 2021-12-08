
// ----------------- //
function get_level() {
	level = floor( num_presents / presents_per_level );
	image_index = level;
}

// ----------------- //
function main() {
	get_level();
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
}

main();