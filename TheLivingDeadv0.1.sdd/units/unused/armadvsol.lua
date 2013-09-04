return {
	armadvsol = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 4096,
		buildcostenergy = 4725,
		buildcostmetal = 343,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "armadvsol_aoplane.dds",
		buildpic = "ARMADVSOL.DDS",
		buildtime = 7945,
		category = "ALL NOTSUB NOWEAPON NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -2 -1",
		collisionvolumescales = "49 11 49",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		damagemodifier = 0.89999997615814,
		description = "Produces Energy",
		energymake = 75,
		energystorage = 100,
		explodeas = "SMALL_BUILDINGEX",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1020,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Advanced Solar Collector",
		objectname = "ARMADVSOL",
		seismicsignature = 0,
		selfdestructas = "SMALL_BUILDING",
		sightdistance = 260,
		usebuildinggrounddecal = true,
		yardmap = "oooo oooo yooy yooy",
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -3 -1",
				collisionvolumescales = "49 7 49",
				collisionvolumetest = 1,
				collisionvolumetype = "CylY",
				damage = 612,
				description = "Advanced Solar Collector Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 12,
				hitdensity = 100,
				metal = 223,
				object = "ARMADVSOL_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "all",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 306,
				description = "Advanced Solar Collector Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				hitdensity = 100,
				metal = 89,
				object = "4X4A",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "all",
			},
		},
		sounds = {
			activate = "solar1",
			canceldestruct = "cancel2",
			deactivate = "solar1",
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
				[1] = "solar1",
			},
		},
	},
}
