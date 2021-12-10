
function fire() {
	show_debug_message("firing");
	if (instance_exists(obj_zombie)) {
		var zomb = instance_nearest(x, y, obj_zombie);
		
		var diff_x = zomb.x - x;
		var diff_y = zomb.y - y;
		
		var sqr_dist = diff_x * diff_x + diff_y * diff_y;
		if (sqr_dist < radius * radius) {	
			var new_bullet = instance_create_depth(x, y, -y, obj_bullet);
			new_bullet.fire_direction_x = zomb.x - x;
			new_bullet.fire_direction_y = zomb.y - y;
			new_bullet.player_fired = false;
			
			is_throwing = true;
			audio_play_sound(sfx_throw, 0, 0);
			
			life_ticks = 0;
		}
		
	}
}

function main() {
	
	var dt = delta_time / 1000000;
	fire_ticks += dt;
	if (fire_ticks > fire_interval) {
		fire();
		fire_ticks = 0;
	}
	
	life_ticks += dt;
	if (life_ticks > life_time) {
		instance_create_depth(x, y, -y, obj_zombie_angry);
		instance_destroy();
	}
}

main();