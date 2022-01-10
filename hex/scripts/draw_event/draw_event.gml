

function draw_hextile() {
	for (var q = -3; q <= 3; ++q) {
		for (var r = -3; r <= 3; ++r) {
			for (var s = -3; s <= 3; ++s) {
				if (q + r + s == 0) {
					draw_cell(q, r);
				}
			}
		}
	}	
}

function draw_event() {
	draw_hextile();
}
