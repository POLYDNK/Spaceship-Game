/// @desc Draw Dest

draw_self();

DrawSetText(c_white, fMenu, fa_center, fa_top);
draw_text(x, y-450, "Destination: " + string(destination));
draw_text(x, y-400, "Warp Timer: " + string(warpTimer));

// Draw Blue Arrow when Offscreen
DrawSpriteWhenOffscreen(sBlueArrow);
