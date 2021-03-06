return {
	corpyro = {
		acceleration = 0.44999998807907,
		brakerate = 0.64999997615814,
		buildcostenergy = 0,
		buildcostmetal = 200,
		buildpic = "CORPYRO.DDS",
		buildtime = 2000,
		canmove = true,
		canCloak = true,
		mincloakdistance = 250,
		cloakCost = 0.0,
		stealth = true,
		initCloaked = true,
		category = "KBOT MOBILE WEAPON ALL ANTIFLAME NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE a1",
		corpse = "HEAP",
		description = "Heavy Machine Gun, Medium Infantry. A1 D1 2MPS",
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 280,
		maxslope = 17,
		maxvelocity = 1,
		maxwaterdepth = 25,
		movementclass = "KBOT2",
		name = "Heavy MG",
		nochasecategory = "VTOL",
		objectname = "CORPYRO",
		seismicsignature = 0,
		selfdestructas = "CORPYRO_BLAST",
		selfdestructcountdown = 1,
		sightdistance = 318,
		smoothanim = true,
		turnrate = 1145,
		upright = true,
		featuredefs = {
			heap = {
				blocking = false,
				category = "heaps",
				damage = 560,
				description = "Pyro Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 124,
				object = "2X2C",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:PILOT",
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
			gator_laser = {
				accuracy = 200,
				areaofeffect = 8,
				beamtime = 0.070000000149012,
				corethickness = 0.17499999701977,
				craterboost = 0,
				cratermult = 0,
				metalpershot = 2,
				explosiongenerator = "custom:SMALL_RED_BURN",
				firestarter = 50,
				impactonly = 1,
				impulseboost = 0.12300000339746,
				impulsefactor = 0.12300000339746,
				interceptedByShieldType = 1,
				laserflaresize = 6,
				name = "Laser",
				noselfdamage = true,
				range = 600,
				reloadtime = 0.1,
				rgbcolor = "1 0 0",
				soundstart = "lasrlit3",
				soundtrigger = true,
				targetmoveerror = 0.15000000596046,
				thickness = 2,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1000,
				damage = {
					a1 = 40,
					a2 = 2,
					a3 = 1,
					bombers = 4,
					default = 40,
					fighters = 4,
					subs = 1,
					vtol = 4,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL A2 A3",
				def = "GATOR_LASER",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
	