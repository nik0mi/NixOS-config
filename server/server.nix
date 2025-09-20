{ pkgs, inputs, ... }:

{
  server = {
    isNormalUser = true;
    description = "server";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      git
      tmux
      btop
      yazi
      auto-cpufreq
    ];
  };

  home-manager = {
	  extraSpecialArgs = { inherit inputs; };
	  users = {
      "server" = import ../server/home.nix;
	  };
  };
}
