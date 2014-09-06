/*
 *		MultIV Simple DM
 *	@file: Player.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

OriginalPlayer <- Player; // Needed for Events

class
	Player extends Player
{
	Team = null
	Money = 0

	function Setup ()
	{
		Team = null;
		Money = Config.DefaultMoney;
	}
}