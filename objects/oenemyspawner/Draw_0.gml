/// @desc Draw Stuff

if (debugDraw)
{
	draw_self();
	DrawSetText(c_maroon, fMenu, fa_center, fa_top);
	draw_text(x+32, y-10, "spawnTimer: " + string(spawnTimer));
}