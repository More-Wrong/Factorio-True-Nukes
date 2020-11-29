data:extend({
	{
		type = "explosion",
		name = "big-uranium-explosion-LUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__True-Nukes-Graphics__/explosion-big/LUQ.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-32, -32},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
	{
		type = "explosion",
		name = "big-uranium-explosion-RUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__True-Nukes-Graphics__/explosion-big/RUQ.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {32, -32},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
	{
		type = "explosion",
		name = "big-uranium-explosion-LLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__True-Nukes-Graphics__/explosion-big/LLQ.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-32, 32},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
	{
		type = "explosion",
		name = "big-uranium-explosion-RLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__True-Nukes-Graphics__/explosion-big/RLQ.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {32, 32},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	}
})
