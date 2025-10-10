{ pkgs }:
let homePath = import ./homePath.nix { inherit pkgs; };
in "${homePath}/dev/Config"

