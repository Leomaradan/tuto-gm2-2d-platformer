/// @description Go to next level

with(oPlayer) {
	if(has_control) {
		has_control = false;
		SlideTransition(TRANS_MODE.NEXT);
	}
}
