/// @description Inherit collisions and update emitters

// Inherit the parent event
event_inherited();

// Update Smoke Trail on low HP
if (!instance_exists(smokeEffect))
{
	smokeEffect = instance_create_depth(x, y, depth, pTrailSmoke);
	smokeEffect.wielder = self;
}

if (hp / hpMax < 0.25)
{
	smokeEffect.amount = 3;
}
else
{
	smokeEffect.amount = 0;
}
