function set_direction() {
	
	var dt = delta_time / 1000000;
	
	var mouse_x_xview = mouse_x - view_xview[0];
	var mouse_y_yview = mouse_y - view_yview[0];
	
	var dir_x = mouse_x_xview - obj_player.x;
	var dir_y = mouse_y_yview - obj_player.y;
	var norm_squared = dir_x * dir_x + dir_y * dir_y;
	var norm = power(norm_squared, 0.5);
	
	hspeed = dir_x / norm * (bullet_speed * dt);
	vspeed = dir_y / norm * (bullet_speed * dt);

}

function set_direction_2() {
	
	var dt = delta_time / 1000000;
	
	var dir_x = fire_direction_x
	var dir_y = fire_direction_y;
	var norm_squared = dir_x * dir_x + dir_y * dir_y;
	var norm = power(norm_squared, 0.5);
	
	hspeed = dir_x / norm * (bullet_speed * dt);
	vspeed = dir_y / norm * (bullet_speed * dt);

}

if (!virtual_initialized) {
	// firing.
	if (player_fired) {
		set_direction(); // this should be muzzle pos
	}
	else {
		set_direction_2();
	}
	virtual_initialized = true;
}

var dt = delta_time / 1000000;
life_ticks += dt;

if (life_ticks >= init_ticks && init == false) {
	init = true;
}
if (life_ticks >= 0.75) {
	instance_destroy();
}