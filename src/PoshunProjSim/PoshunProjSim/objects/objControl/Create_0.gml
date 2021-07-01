/// @desc Create initial objects
instance_create_depth(0, 0, 0, objSheetLoader);
instance_create_depth(400, 300, 0, objShooter);
instance_create_depth(0, 0, 5, objListMenu);

createDialogueBox("Hello!",
"Welcome to my projectile simulator!\nPlease provide a sprite sheet formatted in a grid-like fashion (one row) in order to test it. \n\nHave fun!\n- Poshun",
"Aight");

var oX = room_width - 400;
for (var i = 0; i < 10; i ++) {
	createOptionButton(i, oX, 60 + i * 60);
}

global.heldButton = noone;

displayFps = 0;
alarm[0] = 30;