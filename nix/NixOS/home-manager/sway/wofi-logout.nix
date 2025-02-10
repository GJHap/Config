{ pkgs, ... }:
let src = builtins.readFile ./wofi-logout.sh;
in pkgs.writeScript "wofi-logout.sh" src
