/// @desc Inherit + Draw State

// Draw State
DrawSetText(c_white, fDamage18, fa_center, fa_top);
draw_text(x,y-75, debugDrawState);

// Draw Red Arrow when Offscreen
DrawRedArrowWhenOffscreen();

// Inherit the parent event
event_inherited();
