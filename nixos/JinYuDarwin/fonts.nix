{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      maple-mono.truetype
      maple-mono.NF-unhinted
      maple-mono.NF-CN-unhinted
    ];
  };
}
