/// @desc Interact with the button
buttonY = startY + scrollY;
hover = false;
active = false;

if global.popupDialogue {
	exit;
}

// Determine when the button can be interacted with
if buttonY > 16 && buttonY + buttonHeight < room_height {
	active = true;
}

// If inactive, fade out and cancel other code
if !active {
	if drawAlpha > 0 {
		drawAlpha -= 0.2;
	}
	
	exit;
}

// If active, check if hovering and become visible
if (active
&&	mouse_x > buttonX && mouse_x < buttonX + buttonWidth
&&  mouse_y > buttonY && mouse_y < buttonY + buttonHeight) {
	hover = true;
}

if hover && mouse_check_button_pressed(mb_left) {
	createDialogueBox(room_width div 2, 200, 400, "Error: no sprite loaded in", "Did you close the file selection window without selecting a file?", "Okay thanks");
}

if drawAlpha < 1 {
	drawAlpha += 0.2;
}