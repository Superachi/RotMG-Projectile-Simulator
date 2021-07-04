/// @desc
if !global.menuOpened {
	exit;
}

// Draw the button and its text
drawTextCustom(buttonText, buttonX + buttonWidth div 2, buttonY, fnt_default_bold, c_white, fa_center, fa_top, 0.6, 16, buttonWidth);

// Draw the line
draw_set_alpha(0.6);
draw_rectangle(buttonX, buttonY + buttonHeight + 3, buttonX + buttonWidth, buttonY + buttonHeight + 4, false);