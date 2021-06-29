/// @desc Show instructions and performance stats
draw_set_color(c_white);
draw_set_font(fnt_default);
draw_set_valign(fa_top);
if (global.projSprite == -1) {
	draw_text(16, 32, "Press SPACE to load sprite sheet");
} else {
	draw_text(16, 32, "Sprite loaded, left click to shoot");
	draw_sprite_ext(global.projSprite, 0, 32, 48, 4, 4, 0, c_white, 1);
}


draw_set_valign(fa_bottom);
draw_text(16, room_height - 16,
	"FPS: " + string(round(fps_real))
	+ "\nInstances: " + string(instance_count));