data:extend({
	{
		type = "bool-setting",
		name = "crater-water-filling",
		setting_type = "runtime-global",
		default_value = true
	},
	{
		type = "bool-setting",
		name = "nuke-random-fires",
		setting_type = "runtime-global",
		default_value = true
	},
	{
		type = "double-setting",
		name = "large-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 5,
		default_value = 1
	},
	{
		type = "double-setting",
		name = "huge-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 10,
		default_value = 2
	},
	{
		type = "double-setting",
		name = "really-huge-nuke-fire-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 20,
		default_value = 5
	},
	{
		type = "double-setting",
		name = "large-nuke-blast-range-scaledown",
		setting_type = "runtime-global",
		minimum_value = 1,
		maximum_value = 2,
		default_value = 2
	},
	{
		type = "bool-setting",
		name = "enable-thermobaric",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "bool-setting",
		name = "use-californium",
		setting_type = "startup",
		default_value = true
	}
})
