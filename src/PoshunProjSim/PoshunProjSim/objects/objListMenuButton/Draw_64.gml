/// @desc Draw the button + text
if !global.menuOpened {
	exit;
}

// Change button texture when hovered
var _imageInd = 0;

if hover {
	_imageInd = 1;
}

// Draw the button and its text
draw_set_alpha(1);
draw_sprite_stretched(sprMenuButton, _imageInd, buttonX, buttonY, buttonWidth, buttonHeight);
drawTextCustom(buttonText, buttonX + buttonWidth div 2, buttonY + buttonHeight div 2, fnt_default, c_white, fa_center, fa_center, 1, 16, buttonWidth);