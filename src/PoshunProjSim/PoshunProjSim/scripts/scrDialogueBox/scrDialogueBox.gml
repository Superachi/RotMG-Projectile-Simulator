// Create a pop-up dialogue box that requires the user to click 'OK' before moving on
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

// Create an OK-button with text for the dialogue box
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
