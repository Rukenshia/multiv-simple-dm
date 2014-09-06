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
	Deaths = null
	Kills = null

	// Essential Functions
	function Setup ()
	{
		Team = null;
		Money = Config.DefaultMoney;
		Deaths = Collection();
		Kills = Collection();
	}

	function Destroy ()
	{
		Deaths.Destroy();
		Kills.Destroy();
	}

	// Getters and Setters

	// Is-Functions

	// Other Functions
	function GiveMoney (money, bOutput = true)
	{
		if (bOutput)
			SendInfo("+$" + money);

		return Money += money;
	}

	function JoinTeam (team)
	{
		if (this.Team != null)
		{
			this.Team.Members.Remove(this);
			Player.BroadcastMessage(team.Color + GetName() + " #ffffffswitched from team " + this.Team.Color + this.Team.Name + "#ffffff to " + team.Color + team.Name);
		}
		else
			Player.BroadcastMessage(team.Color + GetName() + " #ffffffjoined team " + team.Color + team.Name);

		this.Team = team;
		team.Members.Add(this);
		Kills.Clear();
		Deaths.Clear();
	}

	function SendError (strMessage)
		SendMessage(Color.Error + strMessage);

	function SendInfo (strMessage)
		SendMessage(Color.Info + strMessage);

	function SendMessage (strMessage, iColor = 0xFFFFFF)
		base.SendMessage(format("#%x%s", iColor, strMessage));

	function SendSuccess (strMessage)
		SendMessage(Color.Success + strMessage);

	function TakeMoney (money, bOutput = true)
	{
		if (Money < money)
			return false;
		if (bOutput)
			SendInfo("-$" + money);

		Money -= money;
		return true;
	}
}