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
	initial_zombies = 10;
	extra_zombies_per_secured_present = 1;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 1;
	extra_presents_per_secured_present = 1;
	present_interval = 3; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 20; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 4; // Make sure this is a multiple of 4
	presents_per_loot_drop = 1;
	player_hp = 5;
	
}

if (room_get_name(room) == "room_level_2") {
	
	// Zombies
	initial_zombies = 10;
	extra_zombies_per_secured_present = 20;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 1;
	extra_presents_per_secured_present = 1;
	present_interval = 3; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 20; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 4; // Make sure this is a multiple of 4
	presents_per_loot_drop = 4;
	player_hp = 1;
	
}

if (room_get_name(room) == "room_level_3") {
	
	// Zombies
	initial_zombies = 10;
	extra_zombies_per_secured_present = 20;
	zombie_interval = 3;
	
	// Presents
	initial_presents = 1;
	extra_presents_per_secured_present = 1;
	present_interval = 3; // "1 / present drop rate"
	
	// Ammo
	initial_ammo = 1;
	ammo_interval = 20; // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 4; // Make sure this is a multiple of 4
	presents_per_loot_drop = 4;
	player_hp = 1;
	
}

obj_base.presents_per_level = presents_to_win / 4;
obj_base.presents_per_loot = presents_per_loot_drop;
obj_player.max_hp = player_hp;
obj_player.hp = obj_player.max_hp;