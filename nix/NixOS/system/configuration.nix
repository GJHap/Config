{ config, pkgs, ... }:
let
  username = import ../../shared/username.nix { };
  user = (pkgs.callPackage ../../shared/user.nix { }).user;
in {
  imports = [
    ./hardware-configuration.nix
    ../../shared/fonts.nix
    ../../shared/nix.nix
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi = { canTouchEfiVariables = true; };
      systemd-boot = {
        consoleMode = "max";
        editor = false;
        enable = true;
      };
    };
    tmp = { cleanOnBoot = true; };
  };
  environment = {
    systemPackages = with pkgs; [ greetd.greetd vulkan-validation-layers ];
  };
  hardware = {
    bluetooth = { enable = true; };
    brillo.enable = true;
    cpu.intel.updateMicrocode = true;
    graphics.enable = true;
  };
  i18n.defaultLocale = "en_US.utf8";
  networking = {
    hostName = username;
    networkmanager.enable = true;
  };
  programs = {
    dconf.enable = true;
    fish.enable = true;
    gnupg = {
      agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gnome3;
      };
    };
    steam = { enable = true; };
    zsh.enable = true;
  };
  security = {
    pam.services.swaylock = { };
    rtkit.enable = true;
  };
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    dbus.enable = true;
    geoclue2.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''agreety --cmd "systemd-cat --identifier=sway sway"'';
        };
      };
    };
    libinput.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = false;
    printing.enable = true;
    pulseaudio.enable = false;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
      };
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
  time.timeZone = "America/Los_Angeles";
  users = {
    users = {
      ${username} = user // {
        extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
      };
    };
  };
  virtualisation.libvirtd.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = true;
  };
}
