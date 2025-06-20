function nix-run -d "nix run #nixpkgs"
  set -l processed_args
  for arg in $argv
    set -a processed_args nixpkgs\#$arg
  end
  command nix run $processed_args
end
