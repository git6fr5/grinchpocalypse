
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// stats
	min_spawn_radius = 4 //max(room_width, room_height);
	max_spawn_radius = min_spawn_radius + 2;
	spawn_interval = 12;
	spawn_ticks = 0;
	spawn_object = obj_zombie;
	max_spawn_objects = 7;
	num_spawn_objects = 0;
	spawn_objects = [];
	
	depth = -y;

	spawn_rate_increase_ticks = 0;
	spawn_rate_increase_interval = 5; // every 5 seconds the spawn rate increases by 1
}

function objects() {

	num_spawn_objects = 0;
	
	for (i = 0; i < instance_number(obj_zombie); i += 1) {
		var zomb = instance_find(obj_zombie, i);
		if (zomb.is_fighting_for_present) {
			num_spawn_objects += 2;
		}
		else {
			num_spawn_objects += 1;
		}
	}
	
	for (i = 0; i < instance_number(obj_zombie_friendly); i += 1) {
		
		num_spawn_objects += 1;

	}
	
	for (i = 0; i < instance_number(obj_zombie_angry); i += 1) {
		var ang_zomb = instance_find(obj_zombie_angry, i);
		if (ang_zomb.is_stealing) {
			num_spawn_objects += 2;
		}
		else {
			num_spawn_objects += 1;
		}
	}

}

function reset_spawns() {
	for (i = 0; i < instance_number(obj_spawner); i += 1) {
		var new_spawner = instance_find(obj_spawner, i);
		new_spawner.spawn_ticks = 0;
	}
	spawn_ticks = 0;
}

// ----------------- //
initialize();