/// @description Core Player Logic

// Get player inputs
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")); // Only true on the first frame where space is pressed

// Calculate movement
var _move = key_right - key_left; // 1 for right, -1 for left
var _touchingFloor = place_meeting(x, y+1, oWall);

hsp = _move * walksp;
vsp = vsp + grv;

// Check if the player can jump
if (_touchingFloor && key_jump) {
	vsp = -jumpsp;
}

// Horizontal collision (but getting as close as possible)
if (place_meeting(x+hsp, y, oWall)) {
	// Sign will return -1 or 1 depending on the base sign of the input. So in this loop, we move 1px each time to fine the closest position
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);	
	}
	hsp = 0;
}
x = x + hsp;	

// Vertical collision (but getting as close as possible)
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y + vsp;	

// Animation
if(!_touchingFloor) {
	// The player is on air
	sprite_index = sPlayerJump;
	image_speed = 0;
	if(vsp > 0) {
		// Falling animation
		image_index = 1;	
	} else {
		// Jumping animation
		image_index = 0;	
	}
} else {
	// Restore default speed
	image_speed = 0.5;
	if(hsp == 0) {
		// Idle animation
		sprite_index = sPlayerIdle;	
	} else {
		// Running animation
		sprite_index = sPlayerWalk;	
	}
}

if(hsp != 0) {
	// Change sprite orientation based on horizontal speed
	image_xscale = sign(hsp);	
}