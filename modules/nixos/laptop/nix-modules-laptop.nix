{ ... }:

{
  imports =
  [
    ./server.nix
    ./stylix.nix
    ./auto-cpufreq.nix

    ../common/nix-modules-common.nix
  ];
}
