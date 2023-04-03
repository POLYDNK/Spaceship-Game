/// @desc Spawn Sequence

// Destroy after sequence
var seqTime = layer_sequence_get_length(seqToSpawn);
alarm_set(0, seqTime);

// Create sequence
myExplosionSq = layer_sequence_create("Instances", x, y, seqToSpawn);
