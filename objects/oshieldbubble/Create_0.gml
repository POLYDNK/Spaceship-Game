/// @desc Play sound at player

playerObj = instance_find(oPlayer, 0);
shieldSound = audio_play_sound_on(playerObj.myAudioEmitter, snShieldLoop, true, 0);