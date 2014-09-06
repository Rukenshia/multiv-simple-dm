/*
 *		MultIV Simple DM
 *	@file: KillRecord.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

class
	KillRecord
{
	Killer = null
	Victim = null
	Distance = 0.0

	constructor (killer, victim)
	{
		Killer = killer;
		Victim = victim;

		local v1 = Killer.GetPosition();
		local v2 = Victim.GetPosition ();

		Distance = sqrt((v2.x - v1.x)*(v2.x - v1.x) + (v2.y - v1.y)*(v2.y - v1.y) + (v2.z - v1.z)*(v2.z - v1.z));
	}

	// Essential Functions
	function Initialize () 
	{
		return true;
	}

	function Destroy ()
	{
		return true;
	}

	// Getters and Setters

	// Is-Functions

	// Other Functions
	function Notify()
	{
		// Award killer and tell it everyone!
		Player.BroadcastMessage(Victim.Team.Color + Victim.GetName() + " #ffffffwas killed by " + Killer.Team.Color + Killer.GetName());
		Killer.GiveMoney(Config.MoneyPerKill);
	}
}