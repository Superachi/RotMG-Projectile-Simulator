// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawTextCustom(_string, _x, _y, _font, _color, _halign, _valign, _alpha, _sep, _w){
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_color(_color);
	draw_set_alpha(_alpha);
	
	draw_text_ext(_x, _y, _string, _sep, _w);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}