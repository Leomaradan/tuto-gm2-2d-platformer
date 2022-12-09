/// @description Core Enemy Logic
vsp = vsp + grv;

var meetWall = meetingResolve(self, oWall, true);	
if(meetWall) {
	meetingResolve(self, oTriggerWarpLevel, true);	
}


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