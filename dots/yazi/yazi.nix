{ ... }:

{
  stylix.targets.yazi.enable = true;

  programs.yazi = {
      enable = true;
      
      settings = {
      	opener.text = [{
          run = "hx \"$@\"";
      	}];
      	opener.editor = [{
          run = "hx \"$@\"";
      	}];
    	};
  };
}
