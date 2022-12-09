/// @description Core Player Logic

#region Controls
if(has_control) {
// Get player inputs
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")); // Only true on the first frame where space is pressed
} else {
	key_left = 0;	
	key_right = 0;	
	key_jump = 0;	
}
#endregion

#region Calculate movement
var _move = key_right - key_left; // 1 for right, -1 for left
var _touchingFloor = place_meeting(x, y+1, oWall);

hsp = _move * walksp;
vsp = vsp + grv;

// Check if the player can jump
if (_touchingFloor && key_jump) {
	vsp = -jumpsp;
}
#endregion

#region Collisions
meetingResolve(self, oWall, false);
#endregion

#region Animation
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
#endregion