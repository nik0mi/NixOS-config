{ pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.yazi}/bin/yazi";
      };
    };
  };
}
