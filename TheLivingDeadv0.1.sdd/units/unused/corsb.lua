return {
	corsb = {
		acceleration = 0.083999998867512,
		brakerate = 1.5,
		buildcostenergy = 7936,
		buildcostmetal = 182,
		buildpic = "CORSB.DDS",
		buildtime = 9022,
		canfly = true,
		canmove = true,
		cansubmerge = true,
		category = "ALL NOTLAND MOBILE WEAPON ANTIGATOR VTOL ANTIFLAME ANTIEMG ANTILASER NOTSUB NOTSHIP NOTHOVER",
		collide = false,
		cruisealt = 110,
		description = "Seaplane Bomber",
		energymake = 0.89999997615814,
		energyuse = 0.89999997615814,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 760,
		maxslope = 10,
		maxvelocity = 8.710000038147,
		maxwaterdepth = 255,
		name = "Maelstrom",
		noautofire = true,
		nochasecategory = "VTOL",
		objectname = "CORSB",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT_AIR",
		sightdistance = 455,
		turnrate = 368,
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "seapsel2",
			},
		},
		weapondefs = {
			core_seaadvbomb = {
				areaofeffect = 100,
				burst = 5,
				burstrate = 0.19,
				collidefriendly = false,
				commandfire = false,
				craterboost = 0,
				cratermult = 0,
				dropped = true,
				edgeeffectiveness = 0.69999998807907,
				explosiongenerator = "custom:CORE_BIGBOMB_EXPLOSION",
				gravityaffected = "true",
				impulseboost = 0.12300000339746,
				impulsefactor = 0.12300000339746,
				manualbombsettings = true,
				model = "bomb",
				name = "SeaAdvancedBombs",
				noselfdamage = true,
				range = 1280,
				reloadtime = 8,
				soundhit = "xplomed2",
				soundstart = "bombrel",
				weapontype = "AircraftBomb",
				damage = {
					bombers = 5,
					default = 210,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badTargetCategory = "VTOL",
				def = "CORE_SEAADVBOMB",
				onlyTargetCategory = "NOTSUB",
			},
		},
	},
}
