/// @desc
draw_self();
if global.selectedEmitter == id {
	draw_set_alpha(1);
	draw_rectangle(x - hitboxSize, y - hitboxSize, x + hitboxSize, y + hitboxSize, true);
}