/// @desc Cleanup

part_emitter_destroy(mySystem, flameEmitter);
part_emitter_destroy(mySystem, sparkEmitter);
part_emitter_destroy(mySystem, smokeEmitter);

part_type_destroy(flame);
part_type_destroy(spark);
part_type_destroy(smoke);

part_system_destroy(mySystem);
