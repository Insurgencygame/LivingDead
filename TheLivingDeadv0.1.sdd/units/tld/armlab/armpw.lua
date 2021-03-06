return {
	armpw = {
		acceleration = 0.45000001430511,
		brakerate = 0.20000000298023,
		buildcostenergy = 0,
		buildcostmetal = 45,
		buildpic = "ARMPW.DDS",
		buildtime = 450,
		canmove = true,
		canCloak = true,
		mincloakdistance = 250,
		cloakCost = 0.0,
		stealth = true,
		initCloaked = true,
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE a1",
		corpse = "DEAD",
		description = "Medium Range Light Infantry A1 D1 2MPS",
		energymake = 0,
		energyuse = 0,
		explodeas = "SMALL_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 140,
		maxslope = 17,
		maxvelocity = 2,
		maxwaterdepth = 12,
		movementclass = "KBOT2",
		name = "MR Light Inf",
		nochasecategory = "VTOL",
		objectname = "ARMPW",
		seismicsignature = 0,
		selfdestructas = "SMALL_UNIT",
		sightdistance = 900,
		smoothanim = true,
		turnrate = 1056,
		upright = true,
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.979118347168 -0.453806965332 -0.796119689941",
				collisionvolumescales = "30.1392364502 18.4953460693 29.797164917",
				collisionvolumetype = "Box",
				damage = 192,
				description = "Peewee Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 40,
				hitdensity = 100,
				metal = 29,
				object = "ARMPW_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 96,
				description = "Peewee Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 12,
				object = "2X2F",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
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
				[1] = "servtny2",
			},
			select = {
				[1] = "servtny2",
			},
		},
		weapondefs = {
			gator_laser = {
				accuracy = 300,
				areaofeffect = 8,
				beamtime = 0.10000000149012,
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
				reloadtime = 0.5,
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
				badtargetcategory = "VTOL A2 a3",
				def = "GATOR_LASER",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}