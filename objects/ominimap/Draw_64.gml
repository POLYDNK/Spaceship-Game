/// @desc Draw Minimap to GUI

// Draw Minimap Background
draw_sprite_stretched(sMinimap, 0, x, y, myWidth, myHeight);

// Only draw elements relative to the player if the player exists
if (instance_exists(oPlayer))
{
	#region Draw Enemys

	for (var i = 0; i < instance_number(oEnemyShip); i++)
	{
		// Find Object
		currentObject = instance_find(oEnemyShip, i);
	
		// Calculate x and y Positions on Minimap
		var xPos = x + ((currentObject.x - oPlayer.x) / scale) + (myWidth/2);
		var yPos = y + ((currentObject.y - oPlayer.y) / scale) + (myHeight/2);
	
		// Determine Whether or Not Position is on Minimap
		{
			if (xPos >= x and xPos <= x+myWidth)
			{
				if (yPos >= y and yPos <= y+myHeight)
				{
					// Draw Minimap Marker
					draw_sprite(sMEnemy, 0, xPos, yPos);
				}
			}
		}
	}

	#endregion

	#region Draw Bullets

	for (var i = 0; i < instance_number(oBullet); i++)
	{
		// Find Object
		currentObject = instance_find(oBullet, i);
	
		// Calculate x and y Positions on Minimap
		var xPos = x + ((currentObject.x - oPlayer.x) / scale) + (myWidth/2);
		var yPos = y + ((currentObject.y - oPlayer.y) / scale) + (myHeight/2);
	
		// Determine Whether or Not Position is on Minimap
		{
			if (xPos >= x and xPos <= x+myWidth)
			{
				if (yPos >= y and yPos <= y+myHeight)
				{
					// Draw Minimap Marker
					draw_sprite(sMBullet, 0, xPos, yPos);
				}
			}
		}
	}

	#endregion
	
	#region Draw Floating Objects

	for (var i = 0; i < instance_number(oFloatingObject); i++)
	{
		// Find Object
		currentObject = instance_find(oFloatingObject, i);
	
		// Calculate x and y Positions on Minimap
		var xPos = x + ((currentObject.x - oPlayer.x) / scale) + (myWidth/2);
		var yPos = y + ((currentObject.y - oPlayer.y) / scale) + (myHeight/2);
	
		// Determine Whether or Not Position is on Minimap
		{
			if (xPos >= x and xPos <= x+myWidth)
			{
				if (yPos >= y and yPos <= y+myHeight)
				{
					// Draw Minimap Marker
					draw_sprite(sMFloating, 0, xPos, yPos);
				}
			}
		}
	}

	#endregion

	#region Draw Player

	draw_sprite(sMPlayer, 0, x + (myWidth/2), y + (myHeight/2));

	#endregion
	
	#region Draw Zones
	
	for (var i = 0; i < instance_number(oZone); i++)
	{
		// Find Object
		currentObject = instance_find(oZone, i);
		var zS = currentObject.zoneSize / scale;
	
		// Calculate x and y Positions on Minimap
		var xPos = x + ((currentObject.x - oPlayer.x) / scale) + (myWidth/2);
		var yPos = y + ((currentObject.y - oPlayer.y) / scale) + (myHeight/2);
	
		// Determine Whether or Not Position is on Minimap
		{
			if (xPos >= x-zS and xPos <= x+myWidth+zS)
			{
				if (yPos >= y-zS and yPos <= y+myHeight+zS)
				{
					// Draw Minimap Marker
					draw_set_alpha(0.2);
					draw_circle_color(xPos, yPos, zS, c_green, c_lime, false);
					draw_set_alpha(1);
				}
			}
		}
	}
	
	#endregion
}
