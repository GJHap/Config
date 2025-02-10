{ pkgs, ... }:
let src = builtins.readFile ./swayDisplayReloadFix.sh;
in pkgs.writeScript "swayDisplayReloadFix.sh" src
