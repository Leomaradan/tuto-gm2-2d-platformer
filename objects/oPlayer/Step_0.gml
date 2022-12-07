/// @description Core Player Logic

// Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space); // Only true on the first frame where space is pressed

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
	sprite_index = sPlayerA;
	image_speed = 0;
	if(vsp > 0) {
		image_index = 1;	
	} else {
		image_index = 0;	
	}
} else {
	image_speed = 1;
	if(hsp == 0) {
		sprite_index = sPlayer;	
	} else {
		sprite_index = sPlayerR;	
	}
}

if(hsp != 0) {
	image_xscale = sign(hsp);	
}