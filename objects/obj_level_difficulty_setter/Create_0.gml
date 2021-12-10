b_setup = true;
if (room_get_name(room) == "room_level_2") {
	
	// Zombies
	max_zombies_on_screen = 5;
	interval_between_increasing_max_zombies_on_screen = 600;
	interval_between_zombie_spawns_in_seconds = 12; // "1 / zombie spawn rate"
	
	// Presents
	max_present_drops_on_screen = 1;
	interval_between_increasing_max_presents_on_screen = 600;
	interval_between_present_drops_in_seconds = 5; // "1 / present drop rate"
	
	// Ammo
	max_ammo_drops_on_screen = 1;
	interval_between_increasing_max_ammo_on_screen = 600;
	interval_between_ammo_drops_in_seconds = 45 // "1 / ammo drop rate"
	
	// Objectives
	presents_to_win = 16; // Make sure this is a multiple of 4
	presents_per_loot_drop = 4;
	player_hp = 4;
	
}