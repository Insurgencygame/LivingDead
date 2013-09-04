return {
	armgeo = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 2048,
		buildcostenergy = 12568,
		buildcostmetal = 520,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "armgeo_aoplane.dds",
		buildpic = "ARMGEO.DDS",
		buildtime = 13078,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "60 50 60",
		collisionvolumetest = 1,
		collisionvolumetype = "Box",
		corpse = "dead",
		description = "Produces Energy / Storage",
		energymake = 300,
		energystorage = 1000,
		explodeas = "ESTOR_BUILDING",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1750,
		maxslope = 20,
		maxwaterdepth = 0,
		name = "Geothermal Powerplant",
		objectname = "ARMGEO",
		seismicsignature = 0,
		selfdestructas = "ESTOR_BUILDING",
		sightdistance = 273,
		usebuildinggrounddecal = true,
		yardmap = "oooo oGGo oGGo oooo",
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.99999237061 -7.92236328095e-06 -0.0428466796875",
				collisionvolumescales = "68.1631622314 53.8843841553 59.4699707031",
				collisionvolumetype = "Box",
				damage = 1050,
				description = "Geothermal Powerplant Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 40,
				hitdensity = 100,
				metal = 338,
				object = "ARMGEO_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 525,
				description = "Geothermal Powerplant Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 4,
				hitdensity = 100,
				metal = 135,
				object = "4X4B",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "geothrm1",
			},
		},
	},
}
