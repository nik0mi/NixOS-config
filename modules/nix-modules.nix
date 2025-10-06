{ ... }:

{
  imports =
  [
    ./nixos/common.nix
    ./nixos/stylix.nix
    ./nixos/auto-cpufreq.nix
    ./nixos/server.nix
  ];
}
