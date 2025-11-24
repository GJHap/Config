{ config, pkgs, ... }:
let
  configPath = import ../../configPath.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [ lf ];
  xdg.configFile.lf = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/lf";
  };
}
