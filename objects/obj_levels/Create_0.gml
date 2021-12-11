global.curr_level += 1;
global.curr_level = min(4, global.curr_level);

application_surface_draw_enable(true)

if (!audio_is_playing(msc_title)) {
	audio_stop_sound(msc_main_b);
	audio_stop_sound(msc_main_a);
	audio_play_sound(msc_title, 1, true);
}

if (!audio_is_playing(sfx_ambient_snow)) {
	audio_play_sound(sfx_ambient_snow, 1, true);
}
	