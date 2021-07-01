// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createListMenuButton(_dsList, _x, _width, _height, _bottomPadding, _text, _function){
	// Get the position of the previous button, add it to this button's Y coordinates
	var _prevButton = noone;
	if (ds_list_size(_dsList) > 0) {
		_prevButton = ds_list_find_value(_dsList, ds_list_size(_dsList) - 1);
	}
	
	var _y;
	if _prevButton != noone {
		_y = _prevButton.buttonY + _prevButton.buttonHeight + _prevButton.bottomPadding;
	} else {
		_y = 32;
	}
	
	var obj = instance_create_depth(_x, _y, 0, objListMenuButton);
	with(obj) {
		// Some variables to initialize button interaction/drawing
		drawAlpha = 1;
		active = false;
		hover = false;
		scrollY = 0;
		
		// The dimensions of the button
		buttonWidth = _width;
		buttonHeight = _height;
		
		// The coordinates of the button
		buttonX = _x;
		buttonY = _y;
		startY = buttonY;
		
		// How much space to reserve under this button
		bottomPadding = _bottomPadding;
		
		// The text displayed on the button
		buttonText = _text;
		
		// Determine what the button does
		buttonFunction = _function;
	}
	
	ds_list_add(_dsList, obj);
	return obj;
}

// Get the height of the list menu in pixels
// This can be used to calculate how far the user can scroll the menu
function getListMenuHeight() {
	var _listHeight = 0;
	with(objListMenuButton) {
		_listHeight += buttonHeight + bottomPadding;
	}
	
	show_debug_message("The height of the list is: " + string(_listHeight));
	return _listHeight;
}

function createDialogueBox(_title, _text, _buttonText) {
	global.popupDialogue = true;
	
	var layerId = layer_get_id("DialogueInstances");
	var obj = instance_create_layer(0, 0, layerId, objDialogueBox);
	with(obj) {
		boxX = room_width div 2;
		boxY = 200;
		boxWidth = 400;
		boxHeight = string_height_ext(string(_text) + "\n ", 12, boxWidth - 32) + 72;
		boxTitle = _title;
		boxText = _text;
	}
	
	createDialogueButton(obj.boxX, obj.boxY + obj.boxHeight - 8, _buttonText, 48);
}

function createDialogueButton(_x, _y, _text, _height) {
	var layerId = layer_get_id("DialogueInstances");
	var obj = instance_create_layer(_x, _y, layerId, objDialogueButton);
	with(obj) {
		// Some variables to initialize button interaction/drawing
		hover = false;
		
		// The dimensions of the button
		buttonWidth = string_width(_text) + 32;
		if buttonWidth < 100 {
			buttonWidth = 100;
		}
		
		buttonHeight = _height;
		
		// The coordinates of the button
		buttonX = _x - buttonWidth div 2;
		buttonY = _y;
		
		// The text displayed on the button
		buttonText = _text;
	}
	
	return obj;
}

/*
function createDialogueBoxExt(_x, _y, _width, _title, _text, _buttonText) {
	global.popupDialogue = true;
	
	var layerId = layer_get_id("DialogueInstances");
	var obj = instance_create_layer(0, 0, layerId, objDialogueBox);
	with(obj) {
		boxX = _x;
		boxY = _y;
		boxWidth = _width;
		boxHeight = string_height_ext(_text, 16, boxWidth - 32) + 72;
		boxTitle = _title;
		boxText = _text;
	}
	
	createDialogueButton(_x, _y + obj.boxHeight - 8, _buttonText, 48);
}*/