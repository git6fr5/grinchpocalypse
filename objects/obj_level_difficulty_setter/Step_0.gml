
function get_num_zombies() {
	
	num_zombies = 0;
	
	for (i = 0; i < instance_number(obj_zombie); i += 1) {
		var zomb = instance_find(obj_zombie, i);
		if (zomb.is_fighting_for_present) {
			num_zombies += 2;
		}
		else {
			num_zombies += 1;
		}
	}
	
	for (i = 0; i < instance_number(obj_zombie_friendly); i += 1) {		
		num_zombies += 1;
	}
	
	for (i = 0; i < instance_number(obj_zombie_angry); i += 1) {
		var ang_zomb = instance_find(obj_zombie_angry, i);
		if (ang_zomb.is_stealing) {
			num_zombies += 2;
		}
		else {
			num_zombies += 1;
		}
	}
	
}

function get_num_presents() {
	
	num_presents = 0;
	
	for (i = 0; i < instance_number(obj_present); i += 1) {
		var present = instance_find(obj_present, i);
		if (present.is_falling || present.is_targetable) {
			num_presents += 1;
		}
	}
	
	for (i = 0; i < instance_number(obj_zombie); i += 1) {
		var zombie = instance_find(obj_zombie, i);
		if (zombie.has_present) {
			num_presents += 1;
		}
	}
	
	if (obj_player.has_present) {
		num_presents += 1;
	}
	
}

function get_num_ammo() {
	
	num_ammo = 0;
	
	for (i = 0; i < instance_number(obj_ammo); i += 1) {
		num_ammo += 1;
	}
	
}


function tick_spawners(dt) {
	
	var max_zombies = initial_zombies + floor(extra_zombies_per_secured_present * score);
	if (num_zombies < max_zombies) {
		zombie_ticker += dt;
	}
		
	
	var max_presents = initial_presents + floor(extra_presents_per_secured_present * score);
	if (num_presents < max_presents) {
		present_ticker += dt;
	}
	
	var max_ammo = initial_ammo;
	if (num_ammo < max_ammo) {
		ammo_ticker += dt;
	}
}

function check_spawn() {
	
	if (zombie_ticker > zombie_interval) {
		var spawn_index = random_range(0, instance_number(obj_spawner_zombie));
		var spawner = instance_find(obj_spawner_zombie, spawn_index);
		instance_create_depth(spawner.x+ random_range(-2, 2), spawner.y + random_range(-2, 2), -y, obj_zombie);
		zombie_ticker = 0;
	}
	
	if (present_ticker > present_interval) {
		var spawn_index = random_range(0, instance_number(obj_spawner_presents));
		var spawner = instance_find(obj_spawner_presents, spawn_index);
		instance_create_depth(spawner.x+ random_range(-2, 2), spawner.y + random_range(-2, 2), -y, obj_present);
		present_ticker = 0;
	}

	if (ammo_ticker > ammo_interval) {
		var spawn_index = random_range(0, instance_number(obj_spawner_ammo));
		var spawner = instance_find(obj_spawner_ammo, spawn_index);
		instance_create_depth(spawner.x+ random_range(-2, 2), spawner.y + random_range(-2, 2), -y, obj_ammo);
		ammo_ticker = 0;
	}
	
}

function check_win(dt) {
	
	if (score >= presents_to_win) {
		win_ticks += dt;
		if (win_ticks > win_fade) {
			// audio_stop_sound(sng_title);
			win_ticks = 0;
			var rm = asset_get_index("room_levels");
			room_goto(rm);
		}
	}
	
}
		
	
	
function main() {
	
	get_num_zombies();
	get_num_presents();
	get_num_ammo();
	
	var dt = delta_time / 1000000;
	tick_spawners(dt);
	check_spawn();
	
	check_win(dt);
}

main();

if (!audio_is_playing(msc_main_a) && !audio_is_playing(msc_main_b)) {
	audio_play_sound(msc_main_b, 1, true);
}