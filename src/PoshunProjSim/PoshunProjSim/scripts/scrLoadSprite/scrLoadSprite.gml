// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function importSprite(){
	var file = get_open_filename_ext("", "", "", "Open a sprite sheet");

	if file != "" {
		// Save the sprite in a temporary variable
		var tempSprite = sprite_add(file, 0, false, false, global.frameDimension div 2, global.frameDimension div 2);
		show_debug_message("Sprite index added: " + string(tempSprite));
		
		// Get the width/height of the sprite sheet
		var w = sprite_get_width(tempSprite);
		global.frameDimension = sprite_get_height(tempSprite);
		
		// Calculate the amount of sub images, based on the sprite and sheet size
		global.frameCount = w div global.frameDimension;
		sprite_delete(tempSprite);
		
		// Using the sub image amount, properly load in the sprite with the correct amount of subimages
		global.projSprite = sprite_add(file, global.frameCount, false, false, global.frameDimension div 2, global.frameDimension div 2);
		
		// Destroy previous instances of projectiles
		if instance_exists(objProjectile) {
			instance_destroy(objProjectile);
		}
	} else {
		createDialogueBox("Error: couldn't import sprite.", "Couldn't load in the sprite. Did you close the file dialog without selecting an image file?", "Continue");
	}
}

function importBackground(){
	var file = get_open_filename_ext("", "", "", "Open a sprite sheet");

	if file != "" {
		var bg = sprite_add(file, 1, false, false, 0, 0);
		var layerId = layer_get_id("Background");
		var backgroundId = layer_background_get_id(layerId);
		layer_background_sprite(backgroundId, bg);
	} else {
		createDialogueBox("Error: couldn't import background.", "Couldn't load in the sprite. Did you close the file dialog without selecting an image file?", "Continue");
	}
}