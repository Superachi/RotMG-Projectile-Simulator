/// @desc Draw the sidebar and menu name
draw_set_alpha(0.6);
draw_sprite_stretched(sprSidebar, 0, room_width - 252, 0, room_width, room_height);

// Draw the menu's name
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_default_bold);
draw_set_color(c_white);

var menuName = "Undefined";
switch (currentPage) {
	case menuPages.home:
		menuName = "Home";
	break;
	case menuPages.action:
		menuName = "Trajectory settings";
	break;
	case menuPages.visual:
		menuName = "Visual settings";
	break;
}

draw_text(room_width - 136, 16, menuName);

// Draw the scrollbar
draw_set_alpha(0.6);
if menuHeight > room_height {
	draw_set_color(c_white);
	draw_rectangle(room_width - 16, 32, room_width - 19, room_height - 32, false);

	// Calculate the scrollbar's position
	draw_set_alpha(1);
	var _pos = menuScrollY / menuScrollYMax;
	draw_text(128, 128, string(_pos) + ", \nscrollY " + string(menuScrollY) + ", \nscrollMax " + string(menuScrollYMax))
	draw_sprite(sprScrollButton, 0, room_width - 17, 16 + (room_height - 64) * _pos);
} else {
	draw_set_color(c_black);
	draw_rectangle(room_width - 16, 32, room_width - 19, room_height - 32, false);
}