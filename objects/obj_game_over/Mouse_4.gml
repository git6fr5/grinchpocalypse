// stop audio i guess

global.curr_level -= 1;

var rm = asset_get_index("room_levels");
room_goto(rm);