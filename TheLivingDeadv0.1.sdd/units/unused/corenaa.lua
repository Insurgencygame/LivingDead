return {
	corenaa = {
		acceleration = 0,
		activatewhenbuilt = true,
		airsightdistance = 1000,
		brakerate = 0,
		buildangle = 16384,
		buildcostenergy = 23744,
		buildcostmetal = 832,
		buildpic = "CORENAA.DDS",
		buildtime = 23129,
		category = "ALL WEAPON NOTSUB SPECIAL NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -10 0",
		collisionvolumescales = "42 44 42",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Anti-Air Flak Gun - Naval Series",
		energyuse = 0.10000000149012,
		explodeas = "BIG_UNITEX",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1820,
		minwaterdepth = 2,
		name = "Cobra - NS",
		objectname = "CORENAA",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 550,
		waterline = 0.30000001192093,
		yardmap = "wwwwwwwwwwwwwwww",
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0857467651367 -0.0243953491211 7.02119445801",
				collisionvolumescales = "34.8984832764 33.2414093018 54.6983947754",
				collisionvolumetype = "Box",
				damage = 1092,
				description = "Cobra - NS Wreckage",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 1,
				footprintz = 1,
				height = 20,
				hitdensity = 100,
				metal = 541,
				object = "CORENAA_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak1",
			uncloak = "kloak1un",
			underattack = "warning1",
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
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			armflak_gun = {
				accuracy = 1000,
				areaofeffect = 192,
				avoidfriendly = false,
				burnblow = true,
				canattackground = false,
				collidefriendly = false,
				color = 1,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.85000002384186,
				explosiongenerator = "custom:FLASH3",
				gravityaffected = "true",
				impulseboost = 0,
				impulsefactor = 0,
				mygravity = 0.01,
				name = "FlakCannon",
				noselfdamage = true,
				predictboost = 1,
				range = 775,
				reloadtime = 0.55000001192093,
				soundhit = "flakhit",
				soundstart = "flakfire",
				toairweapon = true,
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 2450,
				damage = {
					["else"] = 10,
					bombers = 250,
					commanders = 10,
					crawlingbombs = 10,
					default = 1000,
					fighters = 500,
					heavyunits = 10,
					mines = 10,
					nanos = 10,
					subs = 10,
					vtol = 250,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "ARMFLAK_GUN",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
