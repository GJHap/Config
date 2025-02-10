{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home.packages = with pkgs; [ wezterm ];
  xdg.configFile.wezterm = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/wezterm";
  };
}
