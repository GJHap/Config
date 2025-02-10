{ pkgs, ... }:
let username = import ../../shared/username.nix { };
in {
  imports = [ ../../shared/fonts.nix ../../shared/nix.nix ];
  programs = { zsh = { enable = true; }; };
  system = {
    defaults = { dock = { autohide = true; }; };
    stateVersion = 5;
  };
  users = {
    users = {
      ${username} = (pkgs.callPackage ../../shared/user.nix { }).config;
    };
  };
}
