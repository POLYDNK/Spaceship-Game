/// @desc Check HP and run AI

if ( hp <= 0 )
{
	instance_destroy();
}
else
{
	currentTarget = FindNearestTarget(TEAM.FRIENDLY);
	
	if (currentTarget != noone)
	{
		var dist = distance_to_object(oPlayer); // Distance to target
		
		if (dist <= aggroRange)
		{
			if (hp < (hpMax*0.25))
			{
				myState = AI.RETREAT; // Retreat when close to player and low hp
			}
			else
			{
				if (dist >= strafeRange)
				{
					if (myState == AI.STRAFE)
					{
						if (dist+100 >= strafeRange) and (dist > 500)
						{
							myState = AI.CHASE; // Chase player when outside attack range
						}
					}
					else
					{
						myState = AI.CHASE; // Chase player when outside attack range
					}
				}
				else
				{
					myState = AI.STRAFE; // Strafe player when with attack range
				}
			}
		}
		else
		{
			myState = AI.IDLE; // Idle when player is too far away
		}
	}
	else
	{
		myState = AI.IDLE; // Idle when there's no target to be found
	}
}