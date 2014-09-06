/*
 *		MultIV Simple DM
 *	@file: Commands.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

Commands <- {};

function Commands::Register()
{
	Command.Add("chooseteam", Commands.ChooseTeam);
	Command.Add("ct", Commands.ChooseTeam);
	Command.Add("teams", Commands.TeamInfo);
	Command.Add("t", Commands.TeamInfo);
	Command.Add("stats", Commands.Stats);
	Command.Add("s", Commands.Stats);
	Command.Add("buyweapon", Commands.BuyWeapon);
	Command.Add("w", Commands.BuyWeapon);

	print("Commands registered.");
}

function Commands::BuyWeapon (player, command, ...)
{
	if (vargv.len() == 0)
	{
		// List Weapons
		player.SendInfo("Available Weapons:");
		foreach (i, weapon in Config.Weapons)
		{
			player.SendInfo("[" + weapon.Id + "] " + weapon.Name + " - #00ff00$" + weapon.Costs + Color.Info + ", Ammo: #0000ff" + weapon.Ammo);
		}
		player.SendMessage("Type '/[buyweapon, w] [id or name]");
		return;
	}

	local weapon = null;
	if (Utility.IsNumeric(vargv[0]) && vargv.len() == 1)
	{
		local id = vargv[0].tointeger();
		foreach (i, w in Config.Weapons)
		{
			if (w.Id == id)
			{
				weapon = w;
				break;
			}
		}
	}
	else
	{
		local str = Utility.Implode(vargv);
		foreach (i, w in Config.Weapons)
		{
			if (w.Name == str)
			{
				weapon = w;
				break;
			}
		}
	}
	if (weapon == null)
		return player.SendError("Weapon not found. Type '#ffffff/[buyweapon, w" + Color.Error + "' to show available weapons.");

	if (!player.TakeMoney(weapon.Costs, false))
		return player.SendInfo("You do not have enough money to buy this weapon.");

	player.GiveWeapon(weapon.Id, weapon.Ammo, true);
	return player.SendInfo("Bought Weapon '" + weapon.Name + "'. Remaining Money: #00ff00$" + player.Money);
}

function Commands::ChooseTeam (player, command, ...)
{
	if (vargv.len() == 0)
	{
		// Display teams
		player.SendInfo("Available Teams:");
		foreach (i, team in Teams.All())
		{
			player.SendInfo("[" + (i+1) + "] " + team.Color + team.Name + Color.Info + "  (" + team.Members.Count() + " Members)");
		}
		player.SendMessage("Type #00ff00'/chooseteam [id or name]'#ffffff to join a team.", 0xffffff);
		return;
	}

	local team = null;
	if (vargv.len() == 1 && Utility.IsNumeric(vargv[0]))
	{
		try {
			team = Teams.GetAt(vargv[0].tointeger() - 1);
		}
		catch(e)
			team = null
	}
	else
		local team = Team.GetByName (Utility.Implode(vargv));

	if (team == null)
		return player.SendError("Invalid team '" + Utility.Implode(vargv));

	player.JoinTeam(team);

	// TODO: Team Spawnpoints
	player.Spawn(150.0, 150.0, 100.0, 0.0);
}

function Commands::Stats (player, command, ...)
{
	local k = player.Kills.Count();
	local d = player.Deaths.Count();
	local kd = 0;

	if (d > 0)
		kd = k / d;
	else
		kd = k / (d+1);

	player.SendInfo("#00ff00" +k + " #ffffffKill(s), #ff0000" + d + " #ffffffDeath(s) (Ratio: #8E44AD" + kd + "#ffffff)");
	player.SendInfo("Money: #00ff00$" + player.Money);
}

function Commands::TeamInfo (player, command, ...)
{
	//if (vargv.len() == 0)
	//{
		foreach (i, team in Teams.All())
		{
			player.SendInfo("[" + (i+1) + "] " + team.Color + team.Name + Color.Info + "  (" + team.Members.Count() + " Members, #00ff00" + team.CountKills() + "#ffffffK/#ff0000" + team.CountDeaths() + "#ffffffD)");
		}
	//}

	// TODO: Detailed team stats
}