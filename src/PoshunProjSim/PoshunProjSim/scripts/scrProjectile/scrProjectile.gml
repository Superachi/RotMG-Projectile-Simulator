// This script hosts all the functions required for creating and customizing projectiles
// Allow the user to create a single projectile with given behaviour (actions) and visuals
function bulletCreate(_actionStruct, _visualStruct) {
	var o = instance_create_depth(x, y, 0, objProjectile);
	with(o) {
		// ----- Behaviour
		// General
		lifeTime = _actionStruct.lifeTime;
		lifeTimeBase = lifeTime;
		
		projSpeed = _actionStruct.projSpeed;
		projDir = _actionStruct.projDir;
		
		boomerang = _actionStruct.boomerang;
		reverseMult = 1;
		
		// Acceleration
		accelDelay = _actionStruct.accelDelay;
		accelGoal = _actionStruct.accelGoal;
		accelTime = _actionStruct.accelTime;
		
		// How much to increment the speed with, once acceleration starts
		accelInc = (accelGoal - projSpeed) / accelTime;
		
		// ----- Visuals
		sprite_index = global.projSprite;
		size = _visualStruct.size;
		
		animDelay = _visualStruct.animDelay;
		animFrame = 0;
		delayTime = 0;
		
		animRotate = _visualStruct.animRotate;
		rotateAngle = 0;
		
		faceDir = _visualStruct.faceDir;
		faceDiag = _visualStruct.faceDiag;

		stopOnLastFrame = _visualStruct.stopOnLastFrame;
	}
	
	return(o);
}

// Allow the user to create multiple projectiles at once
function bulletCreateMulti(_actionStruct, _visualStruct, _amount, _arc) {
	// Calculate the directional offset, based on the amount of projectiles fired
	// This is to make the center shot always aimed at the mouse
	var dirOffset = 0;
	dirOffset -= (_arc * (_amount - 1)) / 2;
	
	for (var i = 0; i < _amount; i ++) {
		var b = bulletCreate(_actionStruct, _visualStruct);
		with(b) {
			projDir += dirOffset;
		}
		
		dirOffset += _arc;
	}
}

// Set the bullet's behaviour, such as how long it lasts or its trajectory
function bulletAction(_lifeTime, _speed, _dir, _boomerang, _accelDelay, _accelTime, _accelGoal) constructor {
	// General
	lifeTime = _lifeTime;
	projSpeed = _speed;
	projDir = _dir;
	boomerang = _boomerang;
	
	// Acceleration
	accelDelay = _accelDelay;	// How many frames until the bullet starts changing speed
								// Set this value to -1 to disable this feature
	accelTime = _accelTime;		// The amount of time it takes after the delay to reach the desired speed
	accelGoal = _accelGoal;		// The amount of speed to accelerate (or decelerate) towards
}

// Set the bullet's visual appearance
function bulletVisual(_size, _animDelay, _faceDir, _faceDiag, _stopOnLastFrame, _animRotate) constructor {
	// Size of the rendered sprite. Value 100 = 4 times the pixel size
	size = _size;
	
	// The speed of the animation. Value 1 = 1000 milliseconds (ms) per frame.
	animDelay = _animDelay;
	
	// The current frame of the animation
	animFrame = 0;
	
	// A timer that ticks down between frames, resets to value of animDelay when hitting 0
	delayTime = 0;
	
	// Boolean to determine whether to face the direction the projectile is headed
	faceDir = _faceDir;
	
	// Boolean to determine whether the projectile's facing direction should be offset by -45 degrees
	faceDiag = _faceDiag;
	
	// Boolean to determine whether to freeze animating on the final frame
	stopOnLastFrame = _stopOnLastFrame;
	
	// The speed at which the sprite of the projectile rotates
	// Value 100 = 1 rotation per second
	animRotate = _animRotate;
}