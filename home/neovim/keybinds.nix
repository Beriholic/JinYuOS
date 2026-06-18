{
  programs.lazyvim.config.keymaps = ''
    vim.keymap.set("i", "jk", "<ESC>", { silent = true })

    -- buffers
    vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

    -- git
    vim.keymap.set("n", "<leader>g", function()
      Snacks.lazygit()
    end, { desc = "lazygit" })

    vim.keymap.set("n", "<leader>df", "<cmd>:DiffviewOpen<CR>", { desc = "open file diff" })
    vim.keymap.set("n", "<leader>dF", "<cmd>:DiffviewClose<CR>", { desc = "close file diff" })

    -- grep (snacks picker)
    vim.keymap.set("n", "<leader>fw", function()
      Snacks.picker.grep()
    end, { desc = "grep (snacks)" })
  '';
}
