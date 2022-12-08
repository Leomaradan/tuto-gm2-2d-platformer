/// @description Calculate collision
// Post-Draw work like after step event, but occure after the drawing. 
// Generaly, it's better to do stuff related to drawing

if(place_meeting(x,y,oWall)) {
	instance_destroy();
}

