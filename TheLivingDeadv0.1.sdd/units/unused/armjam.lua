return {
	armjam = {
		acceleration = 0.035000000149012,
		activatewhenbuilt = true,
		brakerate = 0.012000000104308,
		buildcostenergy = 1621,
		buildcostmetal = 97,
		buildpic = "armjam.jpg",
		buildtime = 5933,
		canattack = false,
		canmove = true,
		category = "ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = [[0 -3 0]],
		collisionvolumescales = [[22.6 22.6 32.6]],
		collisionvolumetest = 1,
		collisionvolumetype = "CylZ",
		corpse = "dead",
		description = "Radar Jammer Vehicle",
		energymake = 16,
		energyuse = 100,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 460,
		maxslope = 16,
		maxvelocity = 1.2000000476837,
		maxwaterdepth = 0,
		movementclass = "TANK3",
		name = "Jammer",
		nochasecategory = "MOBILE",
		objectname = "ARMJAM",
		onoffable = true,
		radardistance = 0,
		radardistancejam = 450,
		selfdestructas = "BIG_UNIT",
		sightdistance = 300,
		trackoffset = 8,
		trackstrength = 10,
		tracktype = "StdTank",
		trackwidth = 22,
		turnrate = 505,
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-1.99268341064 -6.74999977051 3.60781097412",
				collisionvolumescales = "23.7459869385 3.61972045898 31.9999847412",
				collisionvolumetype = "Box",
				damage = 368,
				description = "Jammer Wreckage",
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 78,
				object = "ARMJAM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 368,
				description = "Jammer Heap",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 39,
				object = "3X3B",
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
				[1] = "varmmove",
			},
			select = {
				[1] = "radjam1",
			},
		},
		weapondefs = {
			bogus_ground_missile = {
				areaofeffect = 48,
				craterboost = 0,
				cratermult = 0,
				impulseboost = 0,
				impulsefactor = 0,
				metalpershot = 0,
				name = "Missiles",
				range = 800,
				reloadtime = 0.5,
				startvelocity = 450,
				tolerance = 9000,
				turnrate = 33000,
				turret = true,
				weaponacceleration = 101,
				weapontimer = 0.10000000149012,
				weapontype = "Cannon",
				weaponvelocity = 650,
				damage = {
					default = 0,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "BOGUS_GROUND_MISSILE",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}