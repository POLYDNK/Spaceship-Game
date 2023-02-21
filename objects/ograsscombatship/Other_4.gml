/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

booster[0] = instance_create_depth(0,0,depth+350, pTrailEngine);
booster[0].wielder = self;
booster[0].xScale = 0.5;
booster[0].yScale = 0.5;
booster[0].facing = DIRECTION.FORWARD;
booster[0].customSprite = sGreenCrescent;
