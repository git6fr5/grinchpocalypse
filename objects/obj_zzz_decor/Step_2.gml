
alpha = 1;
if (is_colliding_with_player && depth < obj_player.depth) {
	alpha = 0.5;
}
else {
	if (is_colliding_with_something_we_might_want_to_see) {
		for (i = 0; i < thing_index; i += 1) {
			if (depth < things[i].depth) {
				alpha = 0.75;
			} 
		}
	}
	else {
		alpha = 1;
	}
}