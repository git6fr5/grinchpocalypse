
init_time = 1.5;
life_time = 2;
life_ticks = 0;

audio_play_sound(sfx_losing_point, 1, 0);

if (!audio_is_playing(msc_title)) {
	audio_stop_sound(msc_main_a);
	audio_stop_sound(msc_main_b);
	audio_play_sound(msc_title, 1, true);
}