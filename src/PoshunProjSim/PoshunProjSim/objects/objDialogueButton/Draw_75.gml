/// @desc Draw the button + text
var _imageInd = 0;

if hover {
	_imageInd = 1;
}

// Configure the drawing settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

// Draw the button and it text
draw_sprite_stretched(sprMenuButtonGreen, _imageInd, buttonX, buttonY, buttonWidth, buttonHeight);
draw_text(buttonX + buttonWidth div 2, buttonY + buttonHeight div 2, buttonText);

// Reset the alpha
draw_set_alpha(1);