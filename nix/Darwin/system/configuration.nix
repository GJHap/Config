{ pkgs, ... }:
let
  username = import ../../shared/username.nix { };
  user = (pkgs.callPackage ../../shared/user.nix { }).user;
in {
  imports = [ ../../shared/fonts.nix ../../shared/nix.nix ];
  programs = { zsh = { enable = true; }; };
  system = {
    defaults = { dock = { autohide = true; }; };
    stateVersion = 5;
  };
  users = { users = { ${username} = user; }; };
}
