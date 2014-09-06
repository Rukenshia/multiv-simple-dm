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

	print("Commands registered.");
}

function Commands::ChooseTeam (player, command, strTeam, ...)
{
	//player.Spawn();
}