/*
 *		MultIV Simple DM
 *	@file: Team.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

class 
	Team 
{
	Name = ""
	Members = null
	Color = 0xFFFFFF

	// Essential Functions
	constructor (name, color)
	{
		Name = name;
		this.Color = color;
		Members = Collection();
	}

	function Destroy ()
	{

	}

	// Getters and Setters

	// Static
	function GetByName (teamName)
	{
		foreach (team in Teams)
		{
			if (team.Name == teamName)
				return team;
		}
		return null;
	}


	// Is-Functions

	// Other Functions
	function CountKills ()
	{
		local iKills = 0;
		foreach (player in Members.All())
		{
			iKills += player.Kills.Count();
		}
		return iKills;
	}

	function CountDeaths ()
	{
		local iDeaths = 0;
		foreach (player in Members.All())
		{
			iDeaths += player.Deaths.Count();
		}
		return iDeaths;
	}
}