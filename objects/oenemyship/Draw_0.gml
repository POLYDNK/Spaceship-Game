/// @desc Inherit + Draw State

// Draw State
DrawSetText(c_white, fDamage18, fa_center, fa_top);
draw_text(x,y-75, debugDrawState);

// Draw Red Arrow when Offscreen
DrawSpriteWhenOffscreen(sRedArrow);

// Inherit the parent event
event_inherited();
