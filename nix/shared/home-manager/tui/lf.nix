{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home.packages = with pkgs; [ lf ];
  xdg.configFile.lf = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/lf";
  };
}
