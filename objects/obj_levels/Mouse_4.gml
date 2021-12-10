
// audio_stop_sound(sng_title);

level_list = ["room_level_1", "room_level_2", "room_level_3"]
var rm = asset_get_index(level_list[global.curr_level - 1]);
room_goto(rm);