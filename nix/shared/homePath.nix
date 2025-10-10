{ pkgs }:
let username = import ./username.nix { };
in if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}"

