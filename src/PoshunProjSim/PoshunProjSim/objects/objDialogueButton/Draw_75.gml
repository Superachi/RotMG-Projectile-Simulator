/// @desc Draw the button + text
var _imageInd = 0;

if hover {
	_imageInd = 1;
}

// Configure the drawing settings
draw_set_alpha(1);

// Draw the button and it text
draw_sprite_stretched(sprMenuButtonGreen, _imageInd, buttonX, buttonY, buttonWidth, buttonHeight);
drawTextCustom(buttonText, buttonX + buttonWidth div 2, buttonY + buttonHeight div 2 - 10, fnt_default_bold, c_white, fa_center, fa_middle, 1, 0, buttonWidth);

// Reset the alpha
draw_set_alpha(1);