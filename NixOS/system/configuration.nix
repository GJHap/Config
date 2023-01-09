{ config, pkgs, ... }: {
  imports = [
    ./greetd.nix
    ../options/swayAudioIdleInhibit.nix
    ../options/wallpaper.nix
    ../options/swayDisplayReloadFix.nix
    ./hardware-configuration.nix
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "ghapgood" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixStable;
    extraOptions = "experimental-features = nix-command flakes";
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "max";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  networking = {
    hostName = "ghapgood";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.utf8";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    cpu.intel.updateMicrocode = true;
    opengl.enable = true;
    pulseaudio.enable = false;
    brillo.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    avahi = {
      enable = true;
      nssmdns = true;
    };
    tlp.enable = true;
    printing.enable = true;
    xserver.libinput.enable = true;
    power-profiles-daemon.enable = false;
    dbus.enable = true;
  };

  security.rtkit.enable = true;
  users.users.ghapgood = {
    isNormalUser = true;
    description = "Gregory Hapgood";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    dconf.enable = true;
  };

  fonts.fonts = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  virtualisation.libvirtd.enable = true;

  environment = {
    systemPackages = with pkgs; [
      bluez
      brillo
      cargo
      capitaine-cursors
      clipman
      dracula-theme
      dunst
      fd
      firefox
      fish
      fzf
      gcc
      git
      gh
      glib
      gnome.adwaita-icon-theme
      greetd.greetd
      greetd.gtkgreet
      grim
      hurl
      libreoffice
      neovim
      nodejs
      pamixer
      pavucontrol
      playerctl
      python3Full
      ripgrep
      rustc
      slurp
      starship
      stylua
      swappy
      sway
      config.swayAudioIdleInhibit
      swayidle
      swaylock
      xfce.thunar
      thunderbird
      nixfmt
      unzip
      virt-manager
      nixos-artwork.wallpapers.nineish-dark-gray
      waybar
      wayland
      wezterm
      wl-clipboard
      wlogout
      wob
      wofi
      xwayland
    ];
    variables = {
      EDITOR = "nvim";
      MOZ_ENABLE_WAYLAND = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_DESKTOP = "sway";
    };
  };

  system = {
    activationScripts = {
      bash = ''
        ln -sfn ${pkgs.bash}/bin/bash /bin/
        ln -sfn ${pkgs.bash}/bin/bash /usr/bin/
      '';
      ld = ''
        ln -sfn $(cat ${pkgs.stdenv.cc}/nix-support/dynamic-linker) /lib64/
      '';
    };
    stateVersion = "22.05";
  };
}