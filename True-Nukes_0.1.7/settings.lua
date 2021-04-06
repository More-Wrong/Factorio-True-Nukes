data:extend({
	{
		type = "bool-setting",
		name = "crater-water-filling",
		setting_type = "runtime-global",
		default_value = true,
		order = "a0"
	},
	{
		type = "bool-setting",
		name = "nuke-random-fires",
		setting_type = "runtime-global",
		default_value = true,
		order = "a1"
	},
	{
		type = "bool-setting",
		name = "nuke-crater-noise",
		setting_type = "runtime-global",
		default_value = true,
		order = "a2"
	},
	{
		type = "bool-setting",
		name = "use-height-for-craters",
		setting_type = "runtime-global",
		default_value = true,
		order = "a3"
	},
	{
		type = "double-setting",
		name = "large-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 5,
		default_value = 1,
		order = "b0"
	},
	{
		type = "double-setting",
		name = "huge-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 10,
		default_value = 2,
		order = "b1"
	},
	{
		type = "double-setting",
		name = "really-huge-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 20,
		default_value = 5,
		order = "b2"
	},
	{
		type = "double-setting",
		name = "mega-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 20,
		default_value = 5,
		order = "b3"
	},
	{
		type = "double-setting",
		name = "large-nuke-blast-range-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 2,
		default_value = 1.5,
		order = "c0"
	},
	{
		type = "double-setting",
		name = "really-huge-nuke-blast-range-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 2,
		default_value = 2,
		order = "c1"
	},
	{
		type = "double-setting",
		name = "mega-nuke-blast-range-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 2,
		default_value = 2,
		order = "c2"
	},
	{
		type = "bool-setting",
		name = "enable-thermobaric",
		setting_type = "startup",
		default_value = true,
		order = "a0"
	},
	{
		type = "bool-setting",
		name = "use-californium",
		setting_type = "startup",
		default_value = true,
		order = "b0"
	},
	{
		type = "bool-setting",
		name = "enable-new-craters",
		setting_type = "startup",
		default_value = true,
		order = "d0"
	},
	{
		type = "bool-setting",
		name = "TN-mushroom-cloud-style-nuclear-flash",
		setting_type = "runtime-per-user",
		default_value = true,
		order = "a0",
	}
})
