
if (is_colliding_with_player) {
	if (depth < obj_player.depth) {
		alpha = 0.5;
	}
	else {
		alpha = 1;
	}
}
else {
	alpha = 1;
}