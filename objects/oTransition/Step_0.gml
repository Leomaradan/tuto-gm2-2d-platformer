/// @description Progress the transition

var PERCENT_TARGET = 1.2;

if(mode != TRANS_MODE.OFF) {

	if(mode == TRANS_MODE.INTRO){
		// percent = max(0, percent - 0.05); // Fast transition
		percent = max(0, percent - max((percent/10),0.005)); // Smooth non-linear transition
	} else {
		// percent = min(1, percent + 0.05); // Fast transition
		percent = min(PERCENT_TARGET, percent + max(((PERCENT_TARGET - percent)/10),0.005)); // Smooth non-linear transition
	}
	
	if(percent == PERCENT_TARGET || percent == 0) {
		switch(mode) {
			case TRANS_MODE.INTRO: {
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT: {
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO: {
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}	
			case TRANS_MODE.RESTART: {
				game_restart();
				break;
			}			
		}
	}
}
