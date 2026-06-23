local map = LazyVim.safe_keymap_set
local vim_map = vim.keymap.set
vim_map("i", "jk", "<ESC>", { silent = true })

-- open file

-- buffers
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- git
map("n", "<leader>g", function()
	Snacks.lazygit()
end, { desc = "lazygit" })

map("n", "<leader>df", "<cmd>:DiffviewOpen<CR>", { desc = "open file diff" })
map("n", "<leader>dF", "<cmd>:DiffviewClose<CR>", { desc = "close file diff" })

-- telescope
map("n", "<leader>fw", function()
	Snacks.picker.grep()
end, { desc = "grep (snacks)" })
