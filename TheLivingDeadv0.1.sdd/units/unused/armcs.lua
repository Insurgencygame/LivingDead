return {
	armcs = {
		acceleration = 0.10000000149012,
		brakerate = 0.10000000149012,
		buildcostenergy = 2130,
		buildcostmetal = 255,
		builddistance = 160,
		builder = true,
		buildpic = "ARMCS.DDS",
		buildtime = 5121,
		canmove = true,
		category = "ALL NOTLAND MOBILE NOTSUB NOWEAPON SHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -10 -1",
		collisionvolumescales = "32 30 78",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Tech Level 1",
		energymake = 25,
		energystorage = 100,
		energyuse = 25,
		explodeas = "SMALL_UNITEX",
		floater = true,
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1105,
		maxvelocity = 2.5299999713898,
		metalmake = 0.25,
		metalstorage = 100,
		minwaterdepth = 15,
		movementclass = "BOAT4",
		name = "Construction Ship",
		objectname = "ARMCS",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "SMALL_UNIT",
		sightdistance = 291.20001220703,
		terraformspeed = 1250,
		turninplace = 0,
		turnrate = 648,
		waterline = 4,
		windgenerator = 0.0010000000474975,
		workertime = 250,
		buildoptions = {
			[10] = "armfhp",
			[11] = "asubpen",
			[12] = "armsonar",
			[13] = "armfrad",
			[14] = "armfdrag",
			[15] = "armfrt",
			[16] = "armfhlt",
			[17] = "armtl",
			[18] = "armplat",
			[1] = "armeyes",
			[2] = "armdl",
			[3] = "armtide",
			[4] = "armuwmex",
			[5] = "armfmkr",
			[6] = "armuwms",
			[7] = "armuwes",
			[8] = "armsy",
			[9] = "armasy",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.322250366211 4.26757812502e-05 -0.458877563477",
				collisionvolumescales = "30.6897277832 28.4224853516 78.3307495117",
				collisionvolumetype = "Box",
				damage = 663,
				description = "Construction Ship Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 166,
				object = "ARMCS_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 716,
				description = "Construction Ship Heap",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 59,
				object = "5X5A",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
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
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
	},
}
