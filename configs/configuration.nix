{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      ../modules/nixos/auto-cpufreq.nix
      ../dots/stylix.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.extraOptions = ''warn-dirty = false'';

  boot.loader = {
    systemd-boot.enable = true;

    systemd-boot.configurationLimit = 5;
    efi.canTouchEfiVariables = true;
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

  services.xserver.videoDrivers = [ "amdgpu" ];

  networking.hostName = "ovce";
  
  networking.wireless.iwd.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

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
        cava
        git
        tmux
        firefox
        amnezia-vpn
        telegram-desktop

        vlc
        mpv # video/audio
        qimgv # images
        p7zip # archives
        gedit # text
        zathura # pdf
        bluetuith # bluetooth
        impala # wifi

        #Utils
        mako
        swww
        nwg-look
        brightnessctl
        hyprpolkitagent

        #File Manager
        xfce.thunar
        xfce.thunar-archive-plugin

        #Codestuff
        vscode
        nixd
        alejandra	

        #WMstuff
        niri
        kdlfmt
        fuzzel
        iwmenu
        bzmenu
        waybar

        #Terminal
        fish
        kitty

        #Terminal-utils
        btop
        fastfetch
        auto-cpufreq

        nerd-fonts.jetbrains-mono
      ];
    };
    
    server = {
      isNormalUser = true;
      description = "server";
      shell = pkgs.fish;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        git
        tmux
        btop
        yazi
        auto-cpufreq
      ];
    };
  };
  programs.fish.enable = true;
  programs.light.enable = true;
  programs.firefox.enable = true;
  programs.amnezia-vpn.enable = true;

  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [thunar-archive-plugin];

  nixpkgs.config.allowUnfree = true;
  
  home-manager = {
	  extraSpecialArgs = { inherit inputs; };
	  users = {
	    "ovce" = import ./home.nix;
	  };
  };

  system.stateVersion = "25.05";
}
