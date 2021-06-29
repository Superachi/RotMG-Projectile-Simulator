/// @desc Let the bullet act and animate
x += lengthdir_x(projSpeed, projDir);
y += lengthdir_y(projSpeed, projDir);

delayTime --;
lifeTime --;

if delayTime <= 0 {
	delayTime = round(animDelay * 60);
	
	if !(stopOnLastFrame && animFrame == image_number) {
		animFrame ++;
	}
}

if lifeTime <= 0 {
	instance_destroy();
}