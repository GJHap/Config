{ pkgs, lib, ... }:
{
  imports = [
    ./gui
    ./tui
  ];
  home.homeDirectory = lib.mkForce (import ../homePath.nix { inherit pkgs; });
}
