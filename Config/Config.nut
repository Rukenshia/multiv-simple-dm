/*
 *		MultIV Simple DM
 *	@file: Config.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

Config <- {
	Teams = [
		{
			Name = "Cats",
			Color = "#FF0000"
		},
		{
			Name = "Dogs",
			Color = "#00FF00"
		},
	],
	Weapons = {
		"7": {
			Name = "Pistol",
			Costs = 400,
			Ammo = 100
		},
		"9": {
			Name = "Deagle",
			Costs = 800,
			Ammo = 100
		},
		"10": {
			Name = "Shotgun",
			Costs = 1400,
			Ammo = 30
		},
		"13": {
			Name = "SMG",
			Costs = 900,
			Ammo = 400
		},
		"14": {
			Name = "AK-47",
			Costs = 1500,
			Ammo = 300
		},
		"15": {
			Name = "M4A1",
			Costs = 1500,
			Ammo = 300
		},
		"16": {
			Name = "Sniper Rifle",
			Costs = 4000,
			Ammo = 16
		},
		"18": {
			Name = "RPG",
			Costs = 6000,
			Ammo = 3
		},
	},
	DefaultMoney = 5000, 	// Money everyone gets upon connecting
	MoneyPerKill = 100	 	// Money a player gets when he kills a player
};