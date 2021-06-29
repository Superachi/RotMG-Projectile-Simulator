// This script hosts all the functions required for creating and customizing projectiles
// Allow the user to create a single projectile with given behaviour (actions) and visuals
function bulletCreate(_actionStruct, _visualStruct) {
	var o = instance_create_depth(x, y, 0, objProjectile);
	with(o) {
		// Behaviour
		lifeTime = _actionStruct.lifeTime;
		projSpeed = _actionStruct.projSpeed;
		projDir = _actionStruct.projDir;
		
		// Visuals
		sprite_index = global.projSprite;
		size = _visualStruct.size;
		animDelay = _visualStruct.animDelay;
		animFrame = 0;
		delayTime = 0;
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
function bulletAction(_lifeTime, _speed, _dir) constructor {
	lifeTime = _lifeTime;
	projSpeed = _speed;
	projDir = _dir;
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
	animRotate = _animRotate;
}