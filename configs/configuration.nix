{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      ../modules/modules.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --time --cmd niri-session";
        user = "greeter";
      };
    };
  };

  networking.hostName = "ovce";

  # Replace NetworkManager with systemd-networkd and systemd-resolved
  networking.useNetworkd = true;
  systemd.network.enable = true;
  services.resolved.enable = true; # Integrated DNS resolver

  # Disable other network managers to avoid conflicts
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
  services.libinput.touchpad.disableWhileTyping = true;

  users.users = {
    ovce = {
      isNormalUser = true;
      description = "ovce";
      shell = pkgs.fish;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        #Apps
        git
        lazygit
        python3
        nftables
        tmux
        vesktop
        amnezia-vpn
        telegram-desktop
        inputs.zen-browser.packages.${pkgs.system}.default

        yazi # file manager
        mpv # video/audio
        qimgv # images
        xarchiver # archives forntend
        p7zip # archives backend
        termusic # music
        zathura # pdf

        #Utils
        impala
        bluetui
        mako
        swww
        nwg-look
        hyprpolkitagent

        #WMstuff
        waybar
        wl-clipboard
        fuzzel

        #Terminal
        fish
        kitty

        #Terminal-utils
        btop
        fastfetch
        auto-cpufreq
      ];
    };
  };
 
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.amnezia-vpn.enable = true;

  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };  

  home-manager = {
	  extraSpecialArgs = { inherit inputs; };
	  users = { "ovce" = import ./home.nix; };
  };

  system.stateVersion = "25.05";
}
