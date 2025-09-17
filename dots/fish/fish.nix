{ ... } :

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''set fish_greeting'';
    shellAliases = {
      "nixbuild" = "sudo nixos-rebuild switch --flake ~/.mine/.";
    };
  }; 
}
