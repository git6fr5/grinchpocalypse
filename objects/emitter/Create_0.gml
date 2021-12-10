
pos_x = camera_get_view_x( view_camera[0] );
pos_y = camera_get_view_y( view_camera[0] );

w = camera_get_view_width( view_camera[0] );
h = camera_get_view_height( view_camera[0] );

#region snow

emitter_snow = part_emitter_create(particle_snow_setup.particle_system);

part_emitter_region(particle_snow_setup.particle_system, emitter_snow, pos_x - w, pos_x + w, pos_y - h, pos_y, ps_shape_rectangle, ps_distr_linear );
part_emitter_stream(particle_snow_setup.particle_system, emitter_snow, particle_snow_setup.particle_type_snow, 10 );

#endregion

#region footsteps

emitter_steps_start = 1;
emitter_steps_player = 1;
emitter_steps = []
for (i = emitter_steps_start; i < 100; i+= 1) {
	// var new_particle_system = part_system_create_layer("Particles", i); // foreground
	// part_system_depth( new_particle_system, 0 );
	var new_emitter_steps = part_emitter_create(particle_snow_setup.particle_system);
	emitter_steps[i] = new_emitter_steps;
}


#endregion

#region fireworks

firework_emitter = part_emitter_create(particle_snow_setup.particle_system);

#endregion

#region falling particles

#endregion