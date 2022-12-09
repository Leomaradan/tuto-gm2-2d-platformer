/// @function meetingResolve(instance, target);
/// @param {index} instance Main instance to check
/// @param {index} target Target to check against
/// @param {bool} reverseXReverse the horizontal speed
function meetingResolve(_instance, _target, _reverseX){
	var meet = false;
	with(_instance) {
		if (place_meeting(x+hsp, y, _target)) {
		// Sign will return -1 or 1 depending on the base sign of the input. So in this loop, we move 1px each time to fine the closest position
			while (!place_meeting(x+sign(hsp), y, _target)) {
				x = x + sign(hsp);	
			}
			meet = true;
			if(_reverseX) {	
				hsp = -hsp;
			} else {
				hsp = 0;	
			}
		}
		x = x + hsp;	

		// Vertical collision (but getting as close as possible)
		if (place_meeting(x, y+vsp, _target)) {
			while (!place_meeting(x, y+sign(vsp), _target)) {
				y = y + sign(vsp);	
			}
			meet = true;
			vsp = 0;
		}
		y = y + vsp;	
	}
	
	return meet;
}