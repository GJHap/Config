{ pkgs, ... }:
let username = import ./username.nix { };
in {
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise = { automatic = true; };
    package = pkgs.nixStable;
    settings = { allowed-users = [ username ]; };
  };
}
