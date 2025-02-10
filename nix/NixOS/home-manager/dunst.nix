{ pkgs, config, ... }:
let theme = (import ../theme.nix { }).theme;
in {
  services.dunst = {
    enable = true;
    package = pkgs.dunst.override { withX11 = false; };
    settings = {
      global = {
        background = "#${theme.dracula.background}";
        browser = "brave";
        corner_radius = 10;
        dmenu = "wofi -d -p dunst";
        font = "JetBrainsMono Nerd Font";
        foreground = "#${theme.dracula.foreground}";
        frame_width = 0;
        height = 100;
        icon_path =
          "${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/status/:${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/devices/:${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/legacy/";
        markup = "full";
        monitor = 0;
        separator_color = "foreground";
        timeout = 5;
        width = "(350, 400)";
      };
      urgency_critical = {
        foreground = "#${theme.dracula.red}";
        timeout = 0;
      };
    };
  };
}
