{
  programs.lazyvim.extras = {
    dap.core.enable = true;

    editor = {
      snacks_explorer.enable = true;
      snacks_picker.enable = true;
      outline.enable = true;
      illuminate.enable = true;
    };

    formatting.prettier.enable = true;
    linting.eslint.enable = true;

    util.rest.enable = true;

    lang = {
      docker.enable = true;
      go.enable = true;
      json.enable = true;
      markdown.enable = true;
      nix.enable = true;
      rust = {
        enable = true;
        # rust toolchain managed via rustup in darwin/packages/dev.nix;
        # opt out so nixpkgs doesn't pull a second cargo/rustc (~2GB).
        enableDependencies = false;
      };
      sql.enable = true;
      tailwind.enable = true;
      thrift.enable = true;
      toml.enable = true;
      typescript.enable = true;
      yaml.enable = true;
    };
  };
}
