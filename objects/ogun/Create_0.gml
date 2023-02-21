/// @desc Declare Variables

firingdelay = 0;     // store firing delay
firing = false;
isSetup = false;     // ensure weapon is properly setup before drawing

targetCurrent = noone; // current target

// Audio
myAudioEmitter = audio_emitter_create();
audio_emitter_gain(myAudioEmitter, 0.5);
audio_emitter_falloff(myAudioEmitter, 500, 3000, 1);
