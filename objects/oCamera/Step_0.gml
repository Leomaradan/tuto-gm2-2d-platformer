/// @description Update camera

// Update destination
if(instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
// Division by 25 it to make smooth movements
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Prevent camera to go outside of the room
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if(layer_exists(layer_cloud)) {
	
	layer_y(layer_cloud, y - view_h_half + layer_cloud_offset_y);
}

if(layer_exists(layer_farest)) {
	layer_x(layer_farest, x / 1.5);
	layer_y(layer_farest, y - view_h_half + layer_farest_offset_y);
}

if(layer_exists(layer_far)) {
	layer_x(layer_far, x / 2);
	layer_y(layer_far, y - view_h_half + layer_far_offset_y);
}

if(layer_exists(layer_near)) {
	layer_x(layer_near, x / 4);
	layer_y(layer_near, y - view_h_half + layer_near_offset_y);
}

if(layer_exists(layer_nearest)) {
	layer_x(layer_nearest, x /8);
	layer_y(layer_nearest, y - view_h_half + layer_nearest_offset_y);
}