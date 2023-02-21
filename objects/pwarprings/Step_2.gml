/// @desc Create rings when active and update particle

if (active)
{
	// Update Particles
	part_type_scale(myParticle, 1, 1);
	part_type_size(myParticle, ringWidth, ringHeight, -ringShrinkSpeed, 0);
	part_type_life(myParticle, ringWidth/ringShrinkSpeed, ringHeight/ringShrinkSpeed);
	part_type_color1(myParticle, ringColor);
	
	// Create particles on timer
	if (ringTimer <= 0)
	{
		part_particles_create(mySystem, x, y, myParticle, 1);
		ringTimer = ringInterval;
	}
	
	// Decrement Timer
	ringTimer--;
}
