{ ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev";

    useOSProber = true;
    default = "saved";
    extraEntries = "GRUB_SAVEDEFAULT=true";

    gfxmodeEfi = "1920x1080";
    gfxmodeBios = "1920x1080";
    gfxpayloadBios = "keep";
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
