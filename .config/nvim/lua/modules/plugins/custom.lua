local custom = {}

custom["xeluxee/competitest.nvim"] = {
	lazy = true,
	dependencies = { "MunifTanjim/nui.nvim" },
	config = require("custom.competitest"),
}

return custom
