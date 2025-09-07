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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services.greetd = {
    enable = true;
    settings = {
      default_session = {#inputs.hyprland.packages.${pkgs.system}.hyprland
        command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --time --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "greeter";
      };
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.gvfs.enable = true;

  networking.hostName = "ovce";
  networking.networkmanager.enable = true;
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
  services.libinput.touchpad.disableWhileTyping = true;

  users.users.ovce = {
    isNormalUser = true;
    description = "ovce";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #Apps
      git
      tmux
      firefox
      amnezia-vpn
      telegram-desktop
      
      mako # notification
      mpv # video/audio
      qimgv # images
      p7zip # archives
      gedit # text
      zathura # pdf

      bluetuith # bluetooth
      impala # wifi

      #File Manager
      nemo

      #Codestuff
      nixd
      alejandra	
      vscode

      #Hyprstuff
      hyprland
      hyprshot
      hyprpaper
      hyprpolkitagent
      hyprls
      fuzzel
      waybar
      quickshell
      
      #Terminal
      fish
      kitty
      alacritty

      #Terminal-utils
      btop
      fastfetch
      auto-cpufreq
    ];
  };
  stylix.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];
  
  home-manager = {
	  extraSpecialArgs = { inherit inputs; };
	  users = {
	    "ovce" = import ./home.nix;
	  };
  };

  system.stateVersion = "25.05";
}
