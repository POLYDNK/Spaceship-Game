/// @desc Draw window + dialogue if open

if (open)
{
    // Calculate Position
    winX = display_get_width() * box_margin;
    winY = display_get_height() * 0.6;

    // Draw Header
    draw_sprite_stretched_ext(sFadeBoxOrange, 0, winX, winY-header_height, box_width, header_height, c_white, 1.0);
    
    // Draw Body
    draw_sprite_stretched_ext(sFadeBox, 0, winX, winY, box_width, box_height, c_white, 0.7);

    // Draw Text
    var textX = winX+(box_width/2);
	var speaker = dialogue_script.get_speaker();
    draw_set_alpha(1);
    draw_set_color(c_orange);
    DrawSetText(c_white, fMenu, fa_middle, fa_top);
    draw_text(textX, winY-header_height, speaker);
    
    // Draw Images
    var alienX = box_width + (display_get_width() * box_margin) - box_height;
    if (speaker == "Captain Nova")
    {
		draw_text_ext(textX+text_margin+box_height/2, winY+text_margin, bodyString, 50, box_width-box_height-text_margin);
        draw_sprite_stretched(sPilot1, 0, winX, winY, box_height, box_height); // Pilot
    }
    else if (speaker == "Bubbles")
    {
		draw_text_ext(textX-text_margin-box_height/2, winY+text_margin, bodyString, 50, box_width-box_height-text_margin);
        draw_sprite_stretched(sAquaAlien1, 0, alienX, winY, box_height, box_height); // Alien
    }
	else
	{
		draw_text_ext(textX, winY+text_margin, bodyString, 50, box_width-text_margin); // Default
	}
}
