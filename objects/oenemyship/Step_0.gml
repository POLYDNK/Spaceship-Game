/// @desc Attack Current Target

// Common Vars
var ang = 0;
var dist = 0;

// Calculate angle and distance to target if it exists
if (instance_exists(currentTarget))
{
	ang  = point_direction(x,y,currentTarget.x,currentTarget.y); // angle to target
	dist = distance_to_object(currentTarget);                    // distance to target

	// Rotate Towards target
	switch (myState)
	{
		// ----------------
		// Chasing target
		// ----------------
		case AI.CHASE:
			// Rotate towards target
			RotateTowardsObject(currentTarget, traverseSpeed);
		
			// Set hsp and vsp to move towards target
			hsp = lengthdir_x(maxSpeed, ang);
			vsp = lengthdir_y(maxSpeed, ang);
	
			debugDrawState = "chase";
			break;
	
		// ----------------
		// Doing Nothing
		// ----------------
		case AI.IDLE:
			debugDrawState = "idle";
			break;
	
		// ----------------
		// Looking towards target
		// ----------------
		case AI.LOOK:
			// Rotate towards target
			RotateTowardsObject(currentTarget, traverseSpeed);
		
			debugDrawState = "look";
			break;
	
		// ----------------
		// Retreating from target
		// ----------------
		case AI.RETREAT:
			// Rotate towards target
			RotateTowardsDirection(ang, traverseSpeed);
	
			// Get the x and y coordinates of the aggro range "ring"
			var newPointX = currentTarget.x - lengthdir_x(aggroRange, ang);
			var newPointY = currentTarget.y - lengthdir_y(aggroRange, ang);
	
			// If the distance to the aggro range ring is > 50, then move away from the target
			if (distance_to_point(newPointX, newPointY) > 50)
			{
				hsp = -lengthdir_x(retreatSpeed, ang);
				vsp = -lengthdir_y(retreatSpeed, ang);
			}
	
			debugDrawState = "retreat";
			break;
	
		// ----------------
		// Strafing target
		// ----------------
		case AI.STRAFE:
	
			// Rotate towards target
			RotateTowardsObject(currentTarget, traverseSpeed);
	
			// Calculate orthogonal angle
			var angTangent = ang + 45;
		
			if (dist < (aggroRange))
			{
				angTangent += 45;
			}
	
			// Move in the direction of the orthogonal angle
			hsp = lengthdir_x(maxSpeed, angTangent);
			vsp = lengthdir_y(maxSpeed, angTangent);
	
			debugDrawState = "strafe";
			break;
	
		default:
			break;
	}
}

/*
// Reset Speed (not optimal)
hsp = 0;
vsp = 0;
*/
