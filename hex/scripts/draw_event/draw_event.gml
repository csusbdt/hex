function draw_event() {
	hex()
		.draw()
		.move_right().draw()
		.move_down_left().draw()
		.move_left().draw()
		.move_up_left().draw()
		.move_up_right().draw()
		.move_right().draw();
}
