{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      ../../modules/nixos/laptop/nix-modules-laptop.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.extraOptions = ''warn-dirty = false'';

  boot.loader.grub = {
     enable = true;
     device = "/dev/sda";

     gfxmodeEfi = "1920x1080";
     gfxmodeBios = "1920x1080";
     gfxpayloadBios = "keep";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

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

  networking.useNetworkd = true;
  systemd.network.enable = true;
  services.resolved.enable = true;

  networking.networkmanager.enable = false;
  networking.dhcpcd.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluettoh.powerOnBoot = false;
  
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
    };
  };
 
  nixpkgs.config.allowUnfree = true;

  home-manager = {
	  extraSpecialArgs = { inherit inputs; };
	  users = { "ovce" = import ./home.nix; };
  };

  system.stateVersion = "25.05";
}
