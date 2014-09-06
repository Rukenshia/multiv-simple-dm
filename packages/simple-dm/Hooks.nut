/*
 *		MultIV Simple DM
 *	@file: Hooks.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

originalFunctions <- {};
originalFunctions.print <- print;

function print(str)
{
	return originalFunctions.print("[Simple DM] " + str);
}