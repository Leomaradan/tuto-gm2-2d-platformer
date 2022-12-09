/// @description Go to next level

with(oPlayer) {
	if(has_control) {
		has_control = false;
		slideTransition(TRANS_MODE.NEXT);
	}
}
