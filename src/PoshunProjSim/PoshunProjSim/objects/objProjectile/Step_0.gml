/// @desc Let the bullet act and animate
if global.popupDialogue {
	exit;
}

// Move the projectile
x += lengthdir_x(projSpeed * reverseMult, projDir);
y += lengthdir_y(projSpeed * reverseMult, projDir);

delayTime --;
lifeTime --;

#region Behaviour
	// Destroy self when the lifetime hits 0
	if lifeTime <= 0 {
		instance_destroy();
	}

	// Reverse trajectory if boomerang is true
	if boomerang && (lifeTime < lifeTimeBase div 2 + 1) {
		reverseMult = -1;
	}
	
	// Accelerate
	if accelDelay > 0 {
		accelDelay --;
	} else {
		if accelDelay != -1 && accelTime > 0 {
			accelTime --;
			projSpeed += accelInc;
		}
	}

#endregion

#region Visual
	// Set the animation frame
	if delayTime <= 0 {
		delayTime = animDelay;
	
		if !(stopOnLastFrame && animFrame == image_number) {
			animFrame ++;
		}
	}

	// Rotate the sprite
	if animRotate != 0 {
		rotateAngle += animRotate;
	}
	
#endregion
