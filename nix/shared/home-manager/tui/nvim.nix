{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home.packages = with pkgs; [ neovim ];
  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/nvim";
  };
}
