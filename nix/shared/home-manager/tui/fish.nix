{ config, pkgs, ... }:
let
  configPath = import ../../configPath.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [ fish ];
  xdg.configFile.fish = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/fish";
  };
}
