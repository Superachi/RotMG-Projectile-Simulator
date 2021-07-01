/// @desc
draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Draw the button's name
draw_set_font(fnt_default);
draw_set_color(c_white);
draw_text(x + 50, y, string(option_name));

// Draw the value
draw_set_font(fnt_default_bold);
draw_set_color(c_yellow);
draw_text(x + 50, y + 18, string(option_value) + " " + string(option_unit));

// Draw the icon
draw_sprite_ext(sprOptionIcons, option_icon, x + 76, y + 16, 2, 2, 0, c_white, 1);

// Draw the slider bar
draw_set_color(c_white);
draw_rectangle(x - slider_length div 2, slider_y, x + slider_length div 2, slider_y + 1, false)

// Draw the slider button
draw_sprite_ext(sprButtonSlider, image_index, x - slider_length div 2 + slider_value, slider_y, 2, 2, 0, c_white, 1);