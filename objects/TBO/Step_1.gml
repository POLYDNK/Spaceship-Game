/// @desc Default action when hp <= 0 and destructable

if (hp <= 0) && (destructable == true)
{
	instance_destroy();
}
