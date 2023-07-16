local custom = {}

custom["xeluxee/competitest.nvim"] = {
	lazy = true,
	dependencies = { "MunifTanjim/nui.nvim" },
	config = require("custom.competitest"),
}
custom["CRAG666/code_runner.nvim"] = {
	lazy = true,
	config = require("custom/code_runner"),
}
return custom
