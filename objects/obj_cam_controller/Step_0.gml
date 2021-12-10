
// ----------------- //
function screen_shake(dt) {
	shake_ticks += dt
	if (shake_ticks > shake_duration) {
		shake = false;
		shake_ticks = 0;
	}
	var shake_x = random_range(-shake_magnitude * scale_x, shake_magnitude * scale_x);
	var shake_y = random_range(-shake_magnitude * scale_y, shake_magnitude * scale_y);
	camera_set_view_pos(view_camera[0], view_x + shake_x, view_y + shake_y);
}

function ambient_walking() {
	
	// have a seperate one for angry grinches
	
	var num = instance_number(obj_zombie);
	var prob = 0.01 * num;
	if (random_range(0, 0.99) < prob) {
		var index = floor(random_range(0, 2.95));
		if (!audio_is_playing(ambient_walks[index])) {
			audio_play_sound(ambient_walks[index], 0, false);
		}
	}
	
	
}

function ambient_laughing() {
	
	var num = instance_number(obj_zombie);
	var prob = 0.01 * num;
	if (random_range(0, 0.99) < prob) {
		var index = floor(random_range(0, 2.95));
		if (!audio_is_playing(ambient_laughs[index])) {
			audio_play_sound(ambient_laughs[index], 0, false);
		}
	}
	
}

// ----------------- //
function main() {
	var dt = delta_time / 1000000;
	camera_set_view_pos(view_camera[0], 0, 0);
	if (shake || obj_player.hp < 1) {
		screen_shake(dt);
	}
	
	ambient_walking();
	// ambient_laughing();
	
}

main();

if (virtual_init) {
		
	//for (i = 0; i < instance_number(obj_spawner); i += 1) {
	//	var spawner = instance_find(obj_spawner, i);
	//	spawner.spawn_ticks = spawner.spawn_interval / (i + 1);
	//}
	virtual_init = false;
	
}

x = mouse_x - view_xview[0] + view_xport[0];// + camera_get_view_x(view_camera[0]);
y =  mouse_y - view_yview[0];


