{ ... } :

{
  programs.git = {
    enable = true;
    userName = "nik0mi";
    userEmail = "dertonov@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
