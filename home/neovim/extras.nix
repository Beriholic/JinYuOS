{ pkgs, ... }:
{
  programs.lazyvim.extras = {
    dap.core.enable = true;

    editor = {
      snacks-explorer.enable = true;
      snacks-picker.enable = true;
      outline.enable = true;
      illuminate.enable = true;
    };

    formatting.prettier.enable = true;
    linting.eslint.enable = true;

    lang = {
      docker = {
        enable = true;
        installDependencies = true;
      };
      go = {
        enable = true;
        installDependencies = true;
      };
      json = {
        enable = true;
        installDependencies = true;
      };
      python = {
        enable = true;
        installDependencies = true;
      };
      markdown = {
        enable = true;
        installDependencies = true;
      };
      nix = {
        enable = true;
        installDependencies = true;
      };
      rust = {
        enable = true;
        installDependencies = true;
      };
      sql = {
        enable = true;
        installDependencies = true;
      };
      tailwind = {
        enable = true;
        installDependencies = true;
      };
      toml = {
        enable = true;
        installDependencies = true;
      };
      typescript = {
        enable = true;
        installDependencies = true;
      };
      yaml = {
        enable = true;
        installDependencies = true;
      };
    };

    util.rest = {
      enable = true;
      installDependencies = true;
    };
  };

  programs.lazyvim.extraPackages = with pkgs; [
    # LSP servers — one per enabled lang extra in extras.nix.
    # lazyvim-nix's installDependencies only installs tools it has a
    statix
    pyright # lang.python
    nil # lang.nix
    gopls # lang.go
    rust-analyzer # lang.rust
    marksman # lang.markdown
    docker-compose-language-service # lang.docker (docker_compose_language_service)
    dockerfile-language-server # lang.docker (dockerls)
    taplo # lang.toml
    vtsls # lang.typescript (default = vtsls)
    yaml-language-server # lang.yaml (yamlls)
    tailwindcss-language-server # lang.tailwind
    vscode-langservers-extracted # lang.json (jsonls)
  ];
}
