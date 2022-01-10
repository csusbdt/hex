global.levels       = ds_list_create();
global.base_level   = ds_list_create();
global.object_level = ds_list_create();

ds_list_add(global.levels, global.base_level);
ds_list_add(global.levels, global.object_level);

ds_list_add(global.base_level, hex(0, 0, green_hex_sprite));
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_right());
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_down_right());
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_down_left());
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_left());
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_up_left());
ds_list_add(global.base_level, hex(0, 0, green_hex_sprite).move_up_right());

