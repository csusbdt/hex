function draw_event() {
	var red   = hex(0, 0, red_hex_sprite);
	var green = hex(0, 0, green_hex_sprite).move_right();
	
	green.draw()
		.move_down_left().draw()
		.move_left().draw()
		.move_up_left().draw()
		.move_up_right().draw()
		.move_right().draw();
					
	red.draw();

}
