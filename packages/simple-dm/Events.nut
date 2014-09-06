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
}

function PlayerEvents::OnConnect (player)
{
	player.Setup();
}

function PlayerEvents::OnDisconnect (player, ...)
{

}

function PlayerEvents::OnInGame (player)
{

}