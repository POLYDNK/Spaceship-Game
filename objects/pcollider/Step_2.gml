/// @desc Move object and detect collisions

if (place_meeting(x + hsp, y + vsp, pCollider) == false)
{
	if (orbiting == true)
	{
		// Calculate orthogonal angle
		var origin_x = room_width / 2;
		var origin_y = room_height / 2;
		var ang = point_direction(x,y,origin_x,origin_y) + 90;
	
		// Move in the direction of the orthogonal angle
		hsp = lengthdir_x(orbitSpeed, ang);
		vsp = lengthdir_y(orbitSpeed, ang);
	}

	x += hsp;
	y += vsp;
}
else
{
	/*
	// Play Collision Sound
	var impactSound = choose(snHitSolid1, snHitSolid2, snHitSolid3);
	hit_pitch = random_range(1.5, 2)
	audio_sound_pitch(impactSound, hit_pitch);
	//audio_play_sound_at(impactSound, x, y, 0, 100, 300, 1, false, 0);
	*/

	// Apply formula for perfectly elastic collision
	var cObj = instance_place(x + hsp, y + vsp, pCollider);

	var v1x = hsp;
	var v2x = cObj.hsp;
	
	var v1y = vsp;
	var v2y = cObj.vsp;
	
	var m1 = mass;
	var m2 = cObj.mass;
	
	
	var A = m1 + m2;
	var B = m1 - m2;
	var C = 2 * m2;
	var D = 2 * m1;

	/*
	hsp = ((B / A) * v1x) + ((C / A) * v2x) * 0.5;
	cObj.hsp = ((D / A) * v1x) - ((B / A) * v2x);
	
	vsp = ((B / A) * v1y) + ((C / A) * v2y) * 0.5;
	cObj.vsp = ((D / A) * v1y) - ((B / A) * v2y);
	*/
	
	// Pushing
	var ang = point_direction(x, y, cObj.x, cObj.y);
							  
	x += lengthdir_x(-2, ang);
	y += lengthdir_y(-2, ang);
	
	// Apply formula for inelastic collision
	var pLoss = 0.999;
	
	var vX = ((m1*v1x*pLoss) + (m2*v2x*pLoss)) / (m1+m2);
	var vY = ((m1*v1y*pLoss) + (m2*v2y*pLoss)) / (m1+m2);
	
	hsp = vX;
	cObj.hsp = vX;
	
	vsp = vY;
	cObj.vsp = vY;
}
