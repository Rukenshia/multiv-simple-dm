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

	constructor (name)
	{
		Name = name;
		Members = Collection();
	}
}