// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// stats
	min_spawn_radius = 0;
	max_spawn_radius = 2;
	spawn_interval = 20;
	spawn_ticks = 0;
	spawn_object = obj_ammo;
	max_spawn_objects = 1;
	num_spawn_objects = 0;
	spawn_objects = [];
	
	depth = -y;

}

function objects() {

	num_spawn_objects = 0;
	
	for (i = 0; i < instance_number(obj_ammo); i += 1) {
		var ammo = instance_find(obj_ammo, i);
		num_spawn_objects += 1;
	}
	
}

// ----------------- //
initialize();