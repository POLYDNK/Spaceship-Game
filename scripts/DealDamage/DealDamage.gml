// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DealDamage(dealer, victim)
{
	// Deal shield damage first
	victim.shieldHP -= dealer.damage;
		
	// Carry over remainder to hp reduction
	if (victim.shieldHP < 0)
	{
		victim.hp += victim.shieldHP;
		victim.shieldHP = 0
	}
}
