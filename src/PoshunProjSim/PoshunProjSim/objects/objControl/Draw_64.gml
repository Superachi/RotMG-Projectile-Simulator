/// @desc Show instructions and performance stats
// Draw instructions
draw_set_color(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (global.projSprite == -1) {
	draw_text(16, 16, "https://github.com/Superachi/RotMG-Projectile-Simulator\nPoshun's Projectile Simulator, made with Game Maker pls don't bully :)\nLeft click to load sprite sheet");
} else {
	draw_text(16, 16, "Sprite loaded, left click to shoot, WASD to move emitter\nPress ENTER to load a new sprite\nPress R to randomize!");
}

// Draw FPS
draw_set_valign(fa_bottom);
draw_text(16, room_height - 16,
	"FPS: " + string(displayFps)
	+ "\nInstances: " + string(instance_count));