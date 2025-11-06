{ ... }:

{
  imports =
  [
    ./grub/grub.nix
    ./server/server.nix
    ./auto-cpufreq/auto-cpufreq.nix

    ./laptop-pkgs.nix
    ../common/nix-common.nix
  ];
}
