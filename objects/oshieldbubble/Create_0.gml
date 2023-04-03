/// @desc Play sound at player

playerObj = instance_find(oPlayer, 0);
shieldSound = audio_play_sound_on(playerObj.myAudioEmitter, snBuzz, true, 0);
image_xscale = scale;
image_yscale = scale;