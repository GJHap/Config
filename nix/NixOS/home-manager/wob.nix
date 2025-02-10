{ config, ... }:
let theme = (import ../theme.nix { }).theme;
in {
  services.wob = {
    enable = true;
    settings = {
      "" = {
        anchor = "center left";
        background_color = "${theme.dracula.background}";
        bar_padding = 0;
        border_size = 2;
        height = 350;
        margin = 20;
        orientation = "vertical";
        width = 22;
      };
      "style.volume" = {
        bar_color = "${theme.dracula.green}";
        border_color = "${theme.dracula.green}";
      };
      "style.volume-mute" = {
        bar_color = "${theme.dracula.green}";
        border_color = "${theme.dracula.red}";
      };
      "style.brightness" = {
        bar_color = "${theme.dracula.orange}";
        border_color = "${theme.dracula.orange}";
      };
    };
    systemd = true;
  };
}
