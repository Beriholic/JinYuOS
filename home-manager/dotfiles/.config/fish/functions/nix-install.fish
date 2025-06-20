function nix-install -d "nix profile install #nixpkgs"
  set -l processed_args
  for arg in $argv
    set -a processed_args nixpkgs\#$arg
  end
  command nix profile install $processed_args
end
