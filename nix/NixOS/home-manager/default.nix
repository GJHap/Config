{ pkgs, ... }: {
  imports = [
    ../../shared/home-manager/gui
    ../../shared/home-manager/tui
    ./clipman.nix
    ./direnv.nix
    ./dunst.nix
    ./gammastep.nix
    ./gnome-keyring.nix
    ./gtk.nix
    ./mimeApps.nix
    ./sway-audio-idle-inhibit.nix
    ./sway
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wob.nix
    ./wofi.nix
  ] ++ (if builtins.pathExists ./extras.nix then [ ./extras.nix ] else [ ]);
  home.packages = with pkgs; [
    adwaita-icon-theme
    anki
    bluez
    brillo
    cargo
    capitaine-cursors
    dracula-theme
    gcc
    glib
    grim
    htop
    nixos-artwork.wallpapers.nineish-dark-gray
    python3Full
    playerctl
    pavucontrol
    pamixer
    rustc
    seahorse
    swappy
    slurp
    thunderbird
    virt-manager
    wl-clipboard
    wayland
    xwayland
  ];
}
