{ config, pkgs, ... }:
let
  configPath = import ../../configPath.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    neovim
    tree-sitter
  ];
  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${configPath}/nvim";
  };
}
