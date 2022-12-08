/// @description Core Enemy Logic
vsp = vsp + grv;

// Horizontal collision (but getting as close as possible)
if (place_meeting(x+hsp, y, oWall)) {
	// Sign will return -1 or 1 depending on the base sign of the input. So in this loop, we move 1px each time to fine the closest position
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);	
	}
	hsp = -hsp;
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
if(!place_meeting(x, y+1, oWall)) {
	// The enemy is on air
	sprite_index = sEnemyJump;
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
		sprite_index = sEnemyIdle;	
	} else {
		// Running animation
		sprite_index = sEnemyWalk;	
	}
}

if(hsp != 0) {
	// Change sprite orientation based on horizontal speed
	image_xscale = sign(hsp);	
}