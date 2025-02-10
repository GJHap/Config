{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home.packages = with pkgs; [ fish ];
  xdg.configFile.fish = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/fish";
  };
}
