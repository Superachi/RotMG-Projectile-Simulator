/// @desc Let the bullet act and animate
// Move the projectile
x += lengthdir_x(projSpeed * reverseMult, projDir);
y += lengthdir_y(projSpeed * reverseMult, projDir);

delayTime --;
lifeTime --;

// Set the animation frame
if delayTime <= 0 {
	delayTime = round(animDelay * 60);
	
	if !(stopOnLastFrame && animFrame == image_number) {
		animFrame ++;
	}
}

// Reverse trajectory if boomerang is true
if boomerang && (lifeTime < lifeTimeBase div 2 + 1) {
	reverseMult = -1;
}

// Destroy self when the lifetime hits 0
if lifeTime <= 0 {
	instance_destroy();
}

// Rotate the sprite
if animRotate != 0 {
	rotateAngle += animRotate;
}