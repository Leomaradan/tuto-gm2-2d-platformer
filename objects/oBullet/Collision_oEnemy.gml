/// @description Bullet touch enemy

// "with other" target the collisioned enemy
with(other) {
	hp--;
	flash = 3;
	hit_from = other.direction;
}

// Remove the bullet
instance_destroy();