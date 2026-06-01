{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    fd
    fzf
    gh
    git
    jq
    lazygit
    lsd
    ripgrep
    unzip
    yazi
    zip
    zoxide
  ];
}
