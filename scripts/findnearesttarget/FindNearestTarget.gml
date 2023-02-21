/// @description FindNearestTarget(UNIT_TYPE) Find and return a target
/// @arg team enum UNIT_TYPE - Type of target to look for

function FindNearestTarget(argument0) {

	nearestTarget = noone;

	switch(argument0)
	{
		case TEAM.FRIENDLY:
			nearestTarget = instance_nearest(x, y, oPlayer);		
			break;
	
		case TEAM.ENEMY:
			nearestTarget = instance_nearest(x, y, oEnemyShip);
			break;
	
		default:
			break;
	}

	return nearestTarget;
}
