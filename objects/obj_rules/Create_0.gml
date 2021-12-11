
global.curr_level = 0;

global.snow_gravity = [0.001, 0.002, 0.003, 0.004];


if (!audio_is_playing(msc_title)) {
	audio_stop_sound(msc_main_a);
	audio_stop_sound(msc_main_b);
	audio_play_sound(msc_title, 1, true);
}