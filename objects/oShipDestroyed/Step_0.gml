/// @desc Movement

// Moving
x += hsp;
y += vsp;

// Update audio
audio_emitter_position(myAudioEmitter, x, y, 0);
audio_emitter_velocity(myAudioEmitter, hsp, vsp, 0);