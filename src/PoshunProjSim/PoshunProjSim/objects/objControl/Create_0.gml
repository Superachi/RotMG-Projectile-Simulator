/// @desc Create initial objects
instance_create_depth(0, 0, 0, objSheetLoader);
instance_create_depth(400, 300, 0, objShooter);

var oX = room_width - 80;
createOptionButton(optionTypes.lifetime, oX, 60);
createOptionButton(optionTypes.projSpeed, oX, 120);
createOptionButton(optionTypes.boomerang, oX, 180);
createOptionButton(optionTypes.fireCooldown, oX, 240);
createOptionButton(optionTypes.arc, oX, 300);
createOptionButton(optionTypes.amount, oX, 360);
createOptionButton(optionTypes.animRotate, oX, 420);

global.heldButton = noone;

displayFps = 0;
alarm[0] = 30;