/// @desc
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
drawTextCustom(buttonText, buttonX + buttonWidth div 2, buttonY + 8, fnt_default_bold, c_white, fa_center, fa_top, 1, 16, buttonWidth);
drawTextCustom(string(paramCurrent) + " " + string(paramUnit), buttonX + buttonWidth div 2, buttonY + 28, fnt_default, c_white, fa_center, fa_top, 0.8, 16, buttonWidth);

// Draw the slider
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(sliderX, sliderY + scrollY, sliderX + sliderWidth, sliderY + 1 + scrollY, false);

draw_set_color(c_aqua);
draw_rectangle(sliderX, sliderY + scrollY, sliderX + sliderPos, sliderY + 1 + scrollY, false);

// Display the slider button
draw_sprite(sprSliderButton, 0, sliderX + sliderPos, sliderY + scrollY);