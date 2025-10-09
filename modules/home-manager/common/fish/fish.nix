{ ... } :

{
  home.file.".local/bin/server.sh" = {
    source = ./server.sh;
    executable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''set fish_greeting'';
    functions = {
      nixbuild = { 
        body = ''
          cd ~/.mine/
          git add .
          sudo nixos-rebuild switch --flake ~/.mine/#pc'';
      };
      laptop-nixbuild= {
        body = ''
          cd ~/.mine/
          git add .
          sudo nixos-rebuild switch --flake ~/.mine/#laptop'';
      };
      server = ''server.sh $argv'';
    };
  }; 
}

