return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	cmd = "CompetiTest",
	opts = {
		template_file = "~/.config/nvim/templates/competitest.cpp",
		evaluate_template_modifiers = true,
		-- 需要时在这里覆盖其他配置
		-- 例如:
		-- compile_command = {
		-- 	cpp = { exec = "g++", args = { "-O2", "-std=c++17", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
		-- },
	},
	keys = {
		{ "<leader>acp", "<cmd>CompetiTest run<cr>", desc = "CompetiTest: Run testcases" },
		{ "<leader>acr", "<cmd>CompetiTest receive problem<cr>", desc = "CompetiTest: Receive problem" },
		{ "<leader>aca", "<cmd>CompetiTest add_testcase<cr>", desc = "CompetiTest: Add testcase" },
		{ "<leader>ace", "<cmd>CompetiTest edit_testcase<cr>", desc = "CompetiTest: Edit testcase" },
		{ "<leader>acd", "<cmd>CompetiTest delete_testcase<cr>", desc = "CompetiTest: Delete testcase" },
	},
}
