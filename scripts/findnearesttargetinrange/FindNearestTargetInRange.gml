/// @description FindNearestTargetInRange(UNIT_TYPE, maxrange) Find and return a target within a range
/// @arg type UNIT_TYPE - Type of target to look for
/// @arg int  maxrange  - Maxixmum distance to return a target

function FindNearestTargetInRange(argument0, argument1) {

	targetFound = noone;

	switch(argument0)
	{
		case TEAM.FRIENDLY:
			nearestTarget = instance_nearest(x, y, oPlayer);		
			
			if (distance_to_object(nearestTarget) <= argument1)
			{
				targetFound = nearestTarget;
			}
			break;
	
		case TEAM.ENEMY:
			nearestTarget = instance_nearest(x, y, oEnemyShip);
			
			if (distance_to_object(nearestTarget) <= argument1)
			{
				targetFound = nearestTarget;
			}
			break;
	
		default:
			break;
	}

	return targetFound;
}
