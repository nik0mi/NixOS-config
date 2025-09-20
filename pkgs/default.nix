{ pkgs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    nashville96-steam = final.callPackage ./nashville96-steam.nix {};
  })];
}
