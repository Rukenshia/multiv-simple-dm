/*
 *		MultIV Simple DM
 *	@file: Main.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

function OnPackageStart (package, strArgs)
{
	// Register Commands
	Commands.Register();

	// Register Events
	PlayerEvents.Register();

	VerifyConfig();
	SetupTeams();
}
Event.Add(Package.Current(), "start", OnPackageStart);

function OnPackageStop (package)
{
	foreach (player in Player.All())
		player.Destroy();

	foreach (team in Teams.All())
	{
		team.Destroy();
	}
	//delete Teams;
}
Event.Add(Package.Current(), "stop", OnPackageStop);

function SetupTeams ()
{
	Teams <- Collection();

	foreach (team in Config.Teams)
	{
		if (!team.rawin("Name"))
		{
			print("No 'Name' for Team found")
			continue;
		}

		if (!team.rawin("Color"))
		{
			print("No 'Color' for Team found")
			continue;
		}

		print("Creating Team '" + team.Name + "'");
		Teams.Add(Team(team.Name, team.Color));
	}
}

function VerifyConfig ()
{
	if (!Config.rawin("Teams"))
		throw("Could not load teams");

	if (!Config.rawin("DefaultMoney"))
		Config.DefaultMoney <- 5000;

	if (!Config.rawin("MoneyPerKill"))
		Config.DefaultMoney <- 100;

	if (!Config.rawin("Weapons"))
		Config.Weapons <- {};

	MakeWeaponArray();
}

function MakeWeaponArray ()
{
	local aWeapons = [];
	foreach (i, w in Config.Weapons)
	{
		w.Id <- i.tointeger();
		aWeapons.push(w);
	}

	aWeapons.sort(@(a,b) a.Id <=> b.Id);

	Config.Weapons = aWeapons;

}