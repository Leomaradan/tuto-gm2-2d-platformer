/// @description Kill the enemy if needed

if(hp <= 0)
{
	with(instance_create_layer(x, y, layer, oDead)) {
		direction = other.hit_from;
		hsp = lengthdir_x(3, direction);
		// The corpse made a little jump
		vsp = lengthdir_y(3, direction) - 2;
		
		if(sign(hsp) != 0) {
			image_xscale = sign(hsp);
		}
	}
	
	instance_destroy();
}

