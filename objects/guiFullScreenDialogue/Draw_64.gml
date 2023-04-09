/// @desc Draw window + dialogue if open

if (open) {
    // Calculate Position and Size
    var screenWidth = display_get_width();
    var screenHeight = display_get_height();
    var headerHeight = screenHeight * 0.1; // 10% of screen height
    var bodyHeight = screenHeight * 0.9; // 90% of screen height
    var textMargin = screenWidth * 0.05; // 5% of screen width

    // Draw Header
    draw_sprite_stretched_ext(sFadeBoxOrange, 0, 0, 0, screenWidth, headerHeight, c_white, 1.0);

    // Draw Body
    draw_sprite_stretched_ext(sFadeBox, 0, 0, headerHeight, screenWidth, bodyHeight, c_white, 0.7);

    // Draw Images
    var pilotScale = screenHeight / sprite_get_height(sPilot1) * 0.3;
    var alienScale = screenHeight / sprite_get_height(sAquaAlien1) * 0.3;
    var alienWidth = sprite_get_width(sAquaAlien1) * alienScale;
	var imageY = screenHeight * 0.5;
    draw_sprite_ext(sPilot1, 0, screenWidth * 0.1, imageY, pilotScale, pilotScale, 0, c_white, 1);
    draw_sprite_ext(sAquaAlien1, 0, screenWidth * 0.9 - alienWidth, imageY, alienScale, alienScale, 0, c_white, 1);

    // Draw Text
    var textX = screenWidth / 2;
    draw_set_alpha(1);
    draw_set_color(c_orange);
    DrawSetText(c_white, fMenu, fa_middle, fa_top);
    draw_text(textX, headerHeight / 2, dialogue_script.get_speaker());
    draw_text_ext(textX, imageY + textMargin, bodyString, 50, (screenWidth*0.8) - (2*textMargin) - (2*alienWidth));
}
