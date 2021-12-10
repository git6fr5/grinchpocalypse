
particle_system = part_system_create_layer("Particles", 0); // foreground
part_system_depth( particle_system, room_height );

#region snow

particle_type_snow = part_type_create();
part_type_sprite(particle_type_snow, spr_particle_snow, 0, 0, 1);
part_type_size(particle_type_snow, 1, 1, 0, 0);
part_type_gravity(particle_type_snow, 0.001, 280);

part_type_life(particle_type_snow, 300, 350);
part_type_alpha1(particle_type_snow, 0.75)

#endregion

#region footsteps

particle_type_footsteps = part_type_create();
part_type_sprite(particle_type_footsteps, spr_particle_snow, 0, 0, 1);
part_type_size(particle_type_footsteps, 1, 1, 0, 0);
part_type_gravity(particle_type_footsteps, 0, 0);

part_type_life(particle_type_footsteps, 300, 350);
part_type_alpha2(particle_type_footsteps, 0.4, 0.75);

#endregion

#region shadow

particle_type_shadow = part_type_create();
part_type_sprite(particle_type_shadow, spr_particle_shadow, 0, 0, 1);
part_type_size(particle_type_shadow, 1, 1, 0, 0);
part_type_gravity(particle_type_shadow, 0, 0);

part_type_life(particle_type_shadow, 1, 1);
part_type_alpha1(particle_type_shadow, 0.75);

#endregion