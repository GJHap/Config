{ pkgs, ... }:
let theme = (import ../theme.nix { }).theme;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          format-plugged = "";
          tooltip-format = "{capacity}% remaining";
        };
        clock = {
          format = "{:%d %b %I:%M}";
          calendar = {
            format = {
              months = "<span weight='bold' color='#ecc6d9'>{}</span>";
              today =
                "<span weight='bold' color='#${theme.dracula.green}'>{}</span>";
            };
            mode = "year";
            mode-mon-col = 3;
          };
          tooltip-format = ''
            <span size='large'>{:%Y %B}</span>

            {calendar}'';
        };
        modules-center = [ "clock" ];
        modules-left = [ "sway/workspaces" ];
        modules-right = [ "network" "pulseaudio" "battery" ];
        network = {
          format-ethernet = "󰈁";
          format-disconnected = "";
          format-wifi = "";
          tooltip-format = "{essid}";
        };
        pulseaudio = {
          format = "{icon} {format_source}";
          format-bluetooth = "{icon} 󰂱 {format_source}";
          format-bluetooth-muted = "{icon} 󰂲 {format_source}";
          format-icons = { "default" = [ "󰕿" "󰖀" "󰕾" ]; };
          format-muted = "󰖁 {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          tooltip-format = "{desc}: {volume}%";
        };
        spacing = 10;
        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "󰽴";
          };
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
          };
        };
      };
    };

    style = ''
      * {
         font-family: 'JetBrainsMono Nerd Font';
      }

      #waybar {
         background: #${theme.dracula.background};
         border-radius: 10px;
      }

      .modules-left,
      .modules-right {
         border-radius: 10px;
         background: alpha(#${theme.sway-module}, 0.7);
      }

      #workspaces button {
         padding: 0 5px;
      }

      #workspaces button:hover {
         background: alpha(#${theme.sway-hover}, 0.6);
      }

      #workspaces button.focused {
         color: #${theme.dracula.green};
      }

      #workspaces button.urgent,
      #network.disconnected {
         color: #${theme.dracula.red};
      }

      #workspaces button,
      #clock,
      #battery,
      #network,
      #pulseaudio {
         background: transparent;
         border-radius: 10px;
         color: #${theme.dracula.foreground};
      }

      #clock,
      #battery,
      #network,
      #pulseaudio {
         padding: 0 10px;
      }

      #battery.charging {
         color: #${theme.dracula.green};
      }

      @keyframes battery-critical {
         to {
            color: #${theme.dracula.red};
         }
      }

      #battery.critical:not(.charging) {
         animation: battery-critical 1.5s linear 0s infinite alternate;
      }
    '';
  };
}
