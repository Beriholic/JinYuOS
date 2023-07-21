if not vim.g.vscode then
	require("core")
	require("core.run")
	require("competitest").setup()
	require("code_runner").setup()
end
