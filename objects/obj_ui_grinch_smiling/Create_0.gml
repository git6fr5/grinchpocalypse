
var w = sprite_get_width(sprite_index);
var h = sprite_get_height(sprite_index);

x = clamp(x, w, room_width - w);
y = clamp(y, h, room_height - h);

life_ticks = 0;
life_time = 1;
