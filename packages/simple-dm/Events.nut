/*
 *		MultIV Simple DM
 *	@file: Events.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

PlayerEvents <- {};

function PlayerEvents::Register ()
{
	Event.Add(OriginalPlayer, "connect", PlayerEvents.OnConnect);
	Event.Add(OriginalPlayer, "disconnect", PlayerEvents.OnDisconnect);
	Event.Add(OriginalPlayer, "inGame", PlayerEvents.OnInGame);
	Event.Add(OriginalPlayer, "death", PlayerEvents.OnDeath);

	print("Player Events registered.");
}

function PlayerEvents::OnConnect (player)
{
	player.Setup();
}

function PlayerEvents::OnDisconnect (player, ...)
{

}

function PlayerEvents::OnDeath (player)
{
	local killer = player;
	local kr = KillRecord(player, player);
	player.Deaths.Add(kr);
	killer.Kills.Add(kr);
	kr.Notify();
}

function PlayerEvents::OnInGame (player)
{
	// List Teams
	Commands.ChooseTeam(player, "chooseteam");
}