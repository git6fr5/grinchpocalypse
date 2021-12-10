
part_emitter_region(particle_snow_setup.particle_system, emitter_steps[emitter_steps_player], obj_player.x + 3, obj_player.x -3, obj_player.y -1, obj_player.y +1, ps_shape_rectangle, ps_distr_linear );
part_emitter_stream(particle_snow_setup.particle_system, emitter_steps[emitter_steps_player], particle_snow_setup.particle_type_footsteps, -2);

var max_ind = min(100, instance_number(obj_zombie))
for (i = emitter_steps_start + emitter_steps_player; i < max_ind; i += 1) {
	
	var zombie = instance_find(obj_zombie, i - (emitter_steps_start + emitter_steps_player));
	part_emitter_region(particle_snow_setup.particle_system, emitter_steps[i], zombie.x + 3, zombie.x -3, zombie.y -1, zombie.y +1, ps_shape_rectangle, ps_distr_linear );
	part_emitter_stream(particle_snow_setup.particle_system, emitter_steps[i], particle_snow_setup.particle_type_footsteps, -2);
	
	// part_emitter_region(particle_snow_setup.particle_system, emitter_steps[i], zombie.x, zombie.x, zombie.y, zombie.y, ps_shape_rectangle, ps_distr_linear );
	// part_emitter_stream(particle_snow_setup.particle_system, emitter_steps[i], particle_snow_setup.particle_type_shadow, 1);

}