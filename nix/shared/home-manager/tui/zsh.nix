{ config, pkgs, ... }:
let configPath = import ../../configPath.nix { };
in {
  home = {
    packages = with pkgs; [ zsh ];
    file = {
      ".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "${configPath}/zsh/.zshrc";
      };
      zsh = {
        source = config.lib.file.mkOutOfStoreSymlink "${configPath}/zsh/zsh";
      };
    };
  };
}
