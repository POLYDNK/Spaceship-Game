/// @desc Initialize Vars

// Inheritance
event_inherited()

targetAngle = 0;
followMovement = true;
turning = false;
shooting = false;

// Set my layer
layer = layer_get_id("Instances");

// Healthbar Vars
healthbarWidth = 500;
healthbarHeight = 50;

healthbarX = RES_W / 2 - (healthbarWidth/2);
healthbarY = RES_H - healthbarHeight - 50;

currentFrame = 0;
spriteInfo = sprite_get_info(sHealthHP);
maxFrames = spriteInfo.num_subimages;

// Item Collection
co = noone; // collision object
magnet_speed = 5;
magnet_radius = 200;

// Audio
myAudioEmitter = audio_emitter_create();
audio_emitter_gain(myAudioEmitter, 0.5);
audio_emitter_falloff(myAudioEmitter, 500, 3000, 1);
enginePlayer = audio_play_sound_on(myAudioEmitter, engineSoundStart, false, 1);
audio_stop_sound(enginePlayer);

// Boosters
booster[0] = instance_create_depth(0,0,depth+350, pTrailEngine);
booster[0].wielder = self;
booster[0].x = x;
booster[0].y = y;
booster[0].facing = DIRECTION.FORWARD;

// Start Deactivated
instance_deactivate_object(oPlayer);
