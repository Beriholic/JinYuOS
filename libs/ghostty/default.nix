let
  files = [
    "shaders"
    "config"
  ];
  path = ".config/ghostty";
in
{
  config.home.file = builtins.listToAttrs (
    map (file: {
      name = "${path}/${file}";
      value.source = ./${file};
    }) files
  );
}
