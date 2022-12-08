if(done == 0) {
	vsp = vsp + grv;

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
		if(vsp > 0) {
			done = 1;
			image_index = 1;
		}
		
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);	
		}
		vsp = 0;
	}
	y = y + vsp;
}