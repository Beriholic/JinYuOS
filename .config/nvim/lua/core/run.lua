local function CodeRunner()
	local map = vim.api.nvim_buf_set_keymap
	local opt = { noremap = true, silent = true }
	--[===[========================== Global ===========================]===]

	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		callback = function()
			vim.fn.execute("silent! write")
			vim.notify("Autosaved!", vim.log.levels.INFO, {})
		end,
	})

	--[===[========================== Static ===========================]===]
	-- Run c++
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cpp",
		callback = function()
			map(
				0,
				"n",
				"<S-F10>",
				"<ESC>:w<CR>:split<CR>:te g++ -std=c++11 -Wshadow -Wall -o %:t:r.out %  && time ./%:t:r.out<CR>",
				opt
			)
			map(
				0,
				"n",
				"<F22>",
				"<ESC>:w<CR>:split<CR>:te g++ -std=c++11 -Wshadow -Wall -o %:t:r.out %  && time ./%:t:r.out<CR>",
				opt
			)
		end,
	})
	-- Run python
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function()
			map(0, "n", "<S-F10>", "<ESC>:w<CR>:split<CR>:te python3 %<CR>", opt)
			map(0, "n", "<F22>", "<ESC>:w<CR>:split<CR>:te python3 %<CR>", opt)
		end,
	})
	-- Run java
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "java",
		callback = function()
			map(0, "n", "<S-F10>", "<ESC>:w<CR>:split<CR>:te javac % && java %:t:r<CR>", opt)
			map(0, "n", "<F22>", "<ESC>:w<CR>:split<CR>:te javac % && java %:t:r<CR>", opt)
		end,
	})
	-- Run go
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "go",
		callback = function()
			map(0, "n", "<S-F10>", "<ESC>:w<CR>:split<CR>:te go run %<CR>", opt)
			map(0, "n", "<F22>", "<ESC>:w<CR>:split<CR>:te go run %<CR>", opt)
		end,
	})
	-- Run rust
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			map(0, "n", "<S-F10>", "<ESC>:w<CR>:split<CR>:te rustc % && ./%:t:r<CR>", opt)
			map(0, "n", "<F22>", "<ESC>:w<CR>:split<CR>:te rustc % && ./%:t:r<CR>", opt)
		end,
	})
end
CodeRunner()
