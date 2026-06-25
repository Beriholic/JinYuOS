{
  programs.lazyvim.extras = {
    dap.core.enable = true;

    editor = {
      snacks_explorer.enable = true;
      snacks_picker.enable = true;
      outline.enable = true;
      illuminate.enable = true;
      inc-rename.enable = true;
    };

    formatting.prettier.enable = true;
    linting.eslint.enable = true;

    util = {
      rest.enable = true;
    };
  };
}
