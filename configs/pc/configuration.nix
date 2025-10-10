{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    ../../modules/nixos/pc/nix-modules-pc.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.extraOptions = ''warn-dirty = false'';

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";

    useOSProber = true;
    default = "saved";
    extraEntries = "GRUB_SAVEDEFAULT=true";

    gfxmodeEfi = "1920x1080";
    gfxmodeBios = "1920x1080";
    gfxpayloadBios = "keep";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --time --cmd niri-session";
      user = "greeter";
    };
  };

  networking.hostName = "ovce";

  networking.useNetworkd = true;
  systemd.network.enable = true;
  services.resolved.enable = true;

  networking.networkmanager.enable = false;
  networking.dhcpcd.enable = false;

  security.polkit.enable = true;

  time.timeZone = "Asia/Tomsk";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };
  services.dbus.enable = true;

  users.users = {
    ovce = {
      isNormalUser = true;
      description = "ovce";
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common.default = [ "gtk" ];
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ovce" = import ./home.nix;
    };
  };

  system.stateVersion = "25.05";
}
