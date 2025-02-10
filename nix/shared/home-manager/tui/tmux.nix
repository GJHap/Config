{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home.packages = with pkgs; [ tmux ];
  xdg.configFile.tmux = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/tmux";
  };
}
