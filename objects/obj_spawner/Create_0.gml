
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// stats
	min_spawn_radius = max(room_width, room_height);
	max_spawn_radius = min_spawn_radius + 100;
	spawn_interval = 1;
	spawn_ticks = 0;
	spawn_object = obj_zombie;
	max_spawn_objects = 2;
	num_spawn_objects = 0;
	spawn_objects = [];
	
	depth = -y;

}

function objects() {

	num_spawn_objects = 0;
	num_spawn_objects += instance_number(obj_zombie);
	num_spawn_objects += instance_number(obj_zombie_angry);

}

// ----------------- //
initialize();