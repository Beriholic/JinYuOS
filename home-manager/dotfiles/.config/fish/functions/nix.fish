function ninstall -d "nix profile install #nixpkgs"
  command nix profile install nixpkgs\#$argv
end

function nlist -d "nix profile list"
  command nix profile list
end

function nremove -d "nix profile remove #nixpkgs"
  command nix profile remove $argv
end

function nrun -d "nix run #nixpkgs"
  command nix run nixpkgs\#$argv
end



