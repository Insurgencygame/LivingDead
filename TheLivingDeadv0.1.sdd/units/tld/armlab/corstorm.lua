return {
	corstorm = {
		acceleration = 0.10800000280142,
		brakerate = 0.1879999935627,
		buildcostenergy = 0,
		buildcostmetal = 75,
		buildpic = "CORSTORM.DDS",
		buildtime = 750,
		canmove = true,
		canCloak = true,
		mincloakdistance = 250,
		cloakCost = 0.0,
		stealth = true,
		initCloaked = true,
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE a1",
		corpse = "DEAD",
		description = "Medium Range Rocket Propelled Grenade Infantry A1 D2 13mps",
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 140,
		maxslope = 14,
		maxvelocity = 1.6499999761581,
		maxwaterdepth = 21,
		movementclass = "KBOT2",
		name = "RPG Inf",
		nochasecategory = "VTOL",
		objectname = "CORSTORM",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 800,
		smoothanim = true,
		turnrate = 1103,
		upright = true,
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-0.258720397949 -5.34902047119 6.00907897949",
				collisionvolumescales = "22.6238861084 13.1411590576 35.857635498",
				collisionvolumetype = "Box",
				damage = 402,
				description = "Storm Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 55,
				object = "CORSTORM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 201,
				description = "Storm Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 22,
				object = "2X2C",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:rocketflare",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
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
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
		weapondefs = {
			rpg = {
				accuracy = 1700,
				areaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:VSMLMISSILE_EXPLOSION",
				firestarter = 70,
				impulseboost = 0.12300000339746,
				impulsefactor = 0.22300000339746,
				metalpershot = 13,
				model = "missile",
				name = "Rockets",
				noselfdamage = true,
				range = 900,
				reloadtime = 6,
				smoketrail = true,
				soundhit = "xplosml2",
				soundstart = "rocklit1",
				startvelocity = 790,
				texture2 = "coresmoketrail",
				interceptedByShieldType = 1,
				turret = true,
				weaponacceleration = -20,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 790,
				trajectoryHeight = 0.4,
				damage = {
					a1 = 240,
					a2 = 120,
					a3 = 10,
					default = 100,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL A1 A3",
				def = "rpg",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
