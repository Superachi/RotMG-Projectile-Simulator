/// @desc Show instructions and performance stats
// Draw instructions
draw_set_color(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
if (global.projSprite != -1) {
	draw_text(16, 16, "Sprite loaded, left click to shoot, WASD to move emitter\nPress R to randomize the parameters!");
}

// Draw FPS
draw_set_color(c_white);
draw_set_alpha(0.5);
draw_set_valign(fa_bottom);
draw_text(16, room_height - 16,
	"FPS: " + string(displayFps)
	+ "\nInstances: " + string(instance_count)
	+ "\nProjectiles: "+string(instance_number(objProjectile)));
	
draw_set_alpha(1);