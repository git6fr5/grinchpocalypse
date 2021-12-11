
if (!audio_is_playing(msc_title)) {
	audio_stop_sound(msc_main_a);
	audio_stop_sound(msc_main_b);
	audio_play_sound(msc_title, 1, true);
}