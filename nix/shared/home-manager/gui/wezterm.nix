{ config, pkgs, ... }:
let
  configPath = import ../../configPath.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [ wezterm ];
  xdg.configFile.wezterm = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/wezterm";
  };
}
