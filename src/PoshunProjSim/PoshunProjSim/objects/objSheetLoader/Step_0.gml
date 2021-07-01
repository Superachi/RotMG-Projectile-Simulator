/// @desc Load in a sprite sheet
if (keyboard_check_pressed(vk_enter)) {
	file = get_open_filename_ext("", "", "", "Open a sprite sheet");

	if file != "" {
		// Save the sprite in a temporary variable
		tempSprite = sprite_add(file, 0, false, false, global.frameDimension div 2, global.frameDimension div 2);
		show_debug_message("Sprite index added: " + string(tempSprite));
		
		// Get the width/height of the sprite sheet
		var w = sprite_get_width(tempSprite);
		global.frameDimension = sprite_get_height(tempSprite);
		
		// Calculate the amount of sub images, based on the sprite and sheet size
		global.frameCount = w div global.frameDimension;
		sprite_delete(tempSprite);
		
		// Using the sub image amount, properly load in the sprite with the correct amount of subimages
		global.projSprite = sprite_add(file, global.frameCount, false, false, global.frameDimension div 2, global.frameDimension div 2);
		
		// Create a projectile to display the sprite
		if instance_exists(objProjectile) {
			instance_destroy(objProjectile);
		}
	} else {
		show_message("Oops! Something went wrong loading the sprite.")
	}
}