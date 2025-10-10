{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { inherit pkgs; };
in {
  home.packages = with pkgs; [ tmux ];
  xdg.configFile.tmux = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/tmux";
  };
}
