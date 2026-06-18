{
  programs.lazyvim.config.autocmds = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "txt" },
      callback = function()
        vim.opt_local.spell = false
      end,
    })
  '';
}
