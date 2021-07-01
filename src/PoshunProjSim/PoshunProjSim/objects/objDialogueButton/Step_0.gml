/// @desc Interact with the button
hover = false;

if (mouse_x > buttonX && mouse_x < buttonX + buttonWidth
&&  mouse_y > buttonY && mouse_y < buttonY + buttonHeight) {
	hover = true;
}

if (hover && mouse_check_button_pressed(mb_left))
 || keyboard_check_pressed(vk_escape) {
	global.popupDialogue = false;
	instance_destroy(objDialogueBox);
	instance_destroy();
}