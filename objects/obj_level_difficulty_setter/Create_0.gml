
// audio_stop_sound(sng_title);
//var rm = asset_get_index("room_game");
//room_goto(rm);

if (room_get_name(room) == "room_level_2") {
	
	 obj_spawner.max_spawn_objects = 1;
	 obj_spawner_presents.max_spawn_objects = 1;
	 obj_spawner_ammo.max_spawn_objects = 1;
	 
	 // obj_spawner.rate
	 
	 obj_spawner.spawn_rate_increase_interval = 10; // every 5 seconds the spawn rate increases by  
	 obj_spawner_presents.spawn_rate_increase_interval = 600;
	 obj_spawner_ammo.spawn_rate_increase_interval = 600;
	
	 obj_base.presents_per_level = 1;
	 obj_base.presents_per_loot = 1;
	
	 obj_player.max_hp = 4;
	 obj_player.hp = obj_player.max_hp;
	
}