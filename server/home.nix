{ ... } :

{
  imports =
    [
      ../modules/home-manager/git/git.nix
    ];

  nixpkgs.config.allowUnfree = true;

  home.username = "server";
  home.homeDirectory = "/home/server";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
