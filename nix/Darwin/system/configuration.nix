{ pkgs, ... }:
let
  username = import ../../shared/username.nix { };
  user = (pkgs.callPackage ../../shared/user.nix { }).user;
  interval = {
    Hour = 12;
    Minute = 0;
    Weekday = 7;
  };
in {
  imports = [ ../../shared/fonts.nix ../../shared/nix.nix ];
  nix = {
    gc.interval = [ interval ];
    optimise.interval = [ interval ];
  };
  programs = { zsh = { enable = true; }; };
  system = {
    defaults = { dock = { autohide = true; }; };
    primaryUser = username;
    stateVersion = 5;
  };
  users = { users = { ${username} = user; }; };
}
