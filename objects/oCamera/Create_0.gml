/// @description Setup camera
cam = view_camera[0];

follow = oPlayer;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;

layer_cloud = layer_get_id("Clouds");
layer_farest = layer_get_id("Farest");
layer_far = layer_get_id("Far");
layer_near = layer_get_id("Near");
layer_nearest = layer_get_id("Nearest");

layer_cloud_offset_y = 0;
layer_farest_offset_y = 0;
layer_far_offset_y = 0;
layer_near_offset_y = 0;
layer_nearest_offset_y = 0;

if(layer_exists(layer_cloud)) {
	layer_cloud_offset_y = layer_get_y(layer_cloud);
}

if(layer_exists(layer_farest)) {
	layer_farest_offset_y = layer_get_y(layer_farest);
}

if(layer_exists(layer_far)) {
	layer_far_offset_y = layer_get_y(layer_far);
}

if(layer_exists(layer_near)) {
	layer_near_offset_y = layer_get_y(layer_near);
}

if(layer_exists(layer_nearest)) {
	layer_nearest_offset_y = layer_get_y(layer_nearest);
}