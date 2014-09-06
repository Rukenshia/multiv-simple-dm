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

	VerifyConfig();
	SetupTeams();
}
Event.Add(Package.Current(), "start", OnPackageStart);

function OnPackageStop (package)
{

}
Event.Add(Package.Current(), "stop", OnPackageStop);

function SetupTeams ()
{
	Teams <- Collection();

	foreach (teamName in Config.Teams)
	{
		print("Creating Team '" + teamName + "'");
		Teams.Add(Team(teamName));
	}
}

function VerifyConfig ()
{
	if (!Config.rawin("Teams"))
		throw("Could not load teams");

	if (!Config.rawin("DefaultMoney"))
		Config.DefaultMoney <- 5000;
}