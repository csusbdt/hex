function controller_draw_handler() {
	for (var i = 0; i < ds_list_size(global.levels); ++i) {
		var level = global.levels[| i];
		for (var j = 0; j < ds_list_size(level); ++j) {
			level[| j].draw();
		}
	}
}
