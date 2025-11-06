{ ... }:

{
  imports =
  [
    ./server.nix
    ./auto-cpufreq.nix

    ../common/nix-modules-common.nix
  ];
}
