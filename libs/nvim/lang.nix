{ pkgs, ... }: {
  programs.lazyvim = {

    enableDependencies = true;

    extras.lang = {
      docker.enable = true;
      go.enable = true;
      json.enable = true;
      markdown.enable = true;
      nix.enable = true;
      rust.enable = true;
      sql.enable = true;
      tailwind.enable = true;
      thrift.enable = true;
      toml.enable = true;
      typescript.enable = true;
      yaml.enable = true;
      python.enable = true;
    };
    extraPackages = with pkgs; [
      statix
    ];
  };
}
