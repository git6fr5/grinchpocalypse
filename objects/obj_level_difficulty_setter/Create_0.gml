
// audio_stop_sound(sng_title);
//var rm = asset_get_index("room_game");
//room_goto(rm);

if (room_get_name(room) == "room_level_2") {
	
	for (i = 0; i < instance_number(obj_spawner); i += 1) {
		var spawner = instance_find(obj_spawner, i);
	
		spawner.max_spawn_objects = 5;
		spawner.spawn_interval = 12;
		spawner.spawn_rate_increase_interval = 7; // every 5 seconds the spawn rate increases by  
		
		spawner.spawn_ticks = random_range(0, spawner.spawn_interval);
		
	}
	
	for (i = 0; i < instance_number(obj_spawner_presents); i += 1) {
		var spawner = instance_find(obj_spawner_presents, i);
	
		spawner.max_spawn_objects = 1;
		spawner.spawn_interval = 5;
		spawner.spawn_rate_increase_interval = 5; // every 5 seconds the spawn rate increases by  
		show_debug_message(string(i));
		spawner.spawn_ticks = random_range(0, spawner.spawn_interval);
		
	}
	
	for (i = 0; i < instance_number(obj_spawner_ammo); i += 1) {
		var spawner = instance_find(obj_spawner_ammo, i);
	
		spawner.max_spawn_objects = 1;
		spawner.spawn_interval = 45;
		spawner.spawn_rate_increase_interval = 600; // every 5 seconds the spawn rate increases by  
		
		spawner.spawn_ticks = random_range(0, spawner.spawn_interval);
		
	}
	
	 //obj_spawner_presents.max_spawn_objects = 1;
	 //obj_spawner_ammo.max_spawn_objects = 1;
	 
	 //// obj_spawner.rate
	 
	 //obj_spawner_presents.spawn_rate_increase_interval = 600;
	 //obj_spawner_ammo.spawn_rate_increase_interval = 600;
	
	 obj_base.presents_per_level = 1;
	 obj_base.presents_per_loot = 5;
	
	 obj_player.max_hp = 4;
	 obj_player.hp = obj_player.max_hp;
	
}