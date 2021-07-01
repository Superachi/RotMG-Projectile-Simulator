/// @desc
draw_set_alpha(0.2);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

var _x = boxX;
var _y = boxY;
var _w = boxWidth;
var _h = boxHeight;
var _windowTopH = 48;

// Draw the window itself
draw_set_alpha(1);
draw_sprite_stretched(sprDialogueBG, 0, _x - _w div 2, _y, _w, _windowTopH + _h + 8);

// Draw the window top
draw_sprite_stretched(sprDialogueTop, 0, _x - _w div 2, _y, _w, _windowTopH);

// Draw the top/window text
drawTextCustom(boxTitle, _x, _y + 16, fnt_default_bold, c_white, fa_center, fa_top, 1, 0, _w);
drawTextCustom(boxText,  _x, _y + _windowTopH + 16, fnt_default, c_white, fa_center, fa_top, 1, 16, _w - 32);