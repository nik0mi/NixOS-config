{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/laptop/nix-laptop.nix
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.libinput.touchpad.disableWhileTyping = true;

  hardware.bluetooth.enable = true;
  hardware.bluettoh.powerOnBoot = false;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "ovce" = import ./home.nix; };
  };
}
