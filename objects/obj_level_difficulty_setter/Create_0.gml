num_zombies = 0;
num_presents = 0;
num_ammo = 0;

zombie_ticker = 0;
present_ticker = 0;
ammo_ticker = 0;

win_ticks = 0;
win_fade =2;

if (room_get_name(room) == "room_level_1") {
	
	// Zombies
	initial_zombies = 7;
	extra_zombies_per_secured_present = 1;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 1;
	extra_presents_per_secured_present = 0;
	present_interval = 8; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 15; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 4; // Make sure this is a multiple of 4
	presents_per_loot_drop = 2;
	player_hp = 5;
	
}

if (room_get_name(room) == "room_level_2") {
	
	// Zombies
	initial_zombies = 10;
	extra_zombies_per_secured_present = 2;
	zombie_interval = 7;
	
	// Presents
	initial_presents = 2;
	extra_presents_per_secured_present = 0.5;
	present_interval = 7; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 10; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 8; // Make sure this is a multiple of 4
	presents_per_loot_drop = 2;
	player_hp = 4;
	
}

if (room_get_name(room) == "room_level_3") {
	
	// Zombies
	initial_zombies = 8;
	extra_zombies_per_secured_present = 1.5;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 3;
	extra_presents_per_secured_present = 0;
	present_interval = 5; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 7; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 12; // Make sure this is a multiple of 4
	presents_per_loot_drop = 4;
	player_hp = 3;
	
}

if (room_get_name(room) == "room_endless") {
	
	// Zombies
	initial_zombies = 8;
	extra_zombies_per_secured_present = 1.5;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 3;
	extra_presents_per_secured_present = 0;
	present_interval = 5; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 7; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = infinity; // Make sure this is a multiple of 4
	presents_per_loot_drop = 4;
	player_hp = 3;
	
}

obj_base.presents_per_level = presents_to_win / 4;
obj_base.presents_per_loot = presents_per_loot_drop;
obj_player.max_hp = player_hp;
obj_player.hp = obj_player.max_hp;

if (!audio_is_playing(msc_main_a)) {
	audio_stop_sound(msc_title);
	audio_stop_sound(msc_main_b);
	audio_play_sound(msc_main_a, 1, false);
}

if (!audio_is_playing(sfx_ambient_snow)) {
	audio_play_sound(sfx_ambient_snow, 1, true);
}