// ---------------- //
// everything under this line is ugly.
function setup() {
	for (i = 0; i < instance_number(obj_spawner); i += 1) {
		var spawner = instance_find(obj_spawner, i);
	
		spawner.max_spawn_objects = max_zombies_on_screen;
		spawner.spawn_interval = interval_between_zombie_spawns_in_seconds;
		spawner.spawn_rate_increase_interval = interval_between_increasing_max_zombies_on_screen; // every 5 seconds the spawn rate increases by  
		
		spawner.spawn_ticks = random_range(0, spawner.spawn_interval);
		
	}
	
	for (i = 0; i < instance_number(obj_spawner_presents); i += 1) {
		var spawner = instance_find(obj_spawner_presents, i);
	
		spawner.max_spawn_objects = max_present_drops_on_screen;
		spawner.spawn_interval = interval_between_present_drops_in_seconds;
		spawner.spawn_rate_increase_interval = interval_between_increasing_max_presents_on_screen; // every 5 seconds the spawn rate increases by  
		show_debug_message(string(i));
		spawner.spawn_ticks = random_range(0, spawner.spawn_interval);
		
	}
	
	for (i = 0; i < instance_number(obj_spawner_ammo); i += 1) {
		var spawner = instance_find(obj_spawner_ammo, i);
	
		spawner.max_spawn_objects = max_ammo_drops_on_screen;
		spawner.spawn_interval = interval_between_ammo_drops_in_seconds;
		spawner.spawn_rate_increase_interval = interval_between_increasing_max_ammo_on_screen; // every 5 seconds the spawn rate increases by  
		
		spawner.spawn_ticks = spawner.spawn_interval - 1; // random_range(0, spawner.spawn_interval);
		
	}
	
	 //obj_spawner_presents.max_spawn_objects = 1;
	 //obj_spawner_ammo.max_spawn_objects = 1;
	 
	 //// obj_spawner.rate
	 
	 //obj_spawner_presents.spawn_rate_increase_interval = 600;
	 //obj_spawner_ammo.spawn_rate_increase_interval = 600;
	
	 obj_base.presents_per_level = presents_to_win / 4;
	 obj_base.presents_per_loot = presents_per_loot_drop;
	
	 obj_player.max_hp = player_hp;
	 obj_player.hp = obj_player.max_hp;
	
}

if (b_setup) {
	setup();
	b_setup = false;
}