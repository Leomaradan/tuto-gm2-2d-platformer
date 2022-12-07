/// @description Core Player Logic

// Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space); // Only true on the first frame where space is pressed

// Calculate movement
var _move = key_right - key_left; // 1 for right, -1 for left

hsp = _move * walksp;
vsp = vsp + grv;

// Check if the player can jump
if (place_meeting(x, y+1, oWall) && key_jump) {
	vsp = -jumpsp;
}

// Horizontal collision (but getting as close as possible)
if (place_meeting(x+hsp, y, oWall)) {
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