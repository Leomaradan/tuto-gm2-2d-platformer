/// @function slideTransition(mode, targetRoom?);
/// @param {number} mode Sets transition mode between netx, restart and goto.
/// @param {index} targetRoom Sets target room when using the goto mode.
function slideTransition(argument0, argument1){
	with(oTransition) {
		mode = argument[0];
		if(argument_count > 1) {
			target = argument[1];
		}
	}
}
