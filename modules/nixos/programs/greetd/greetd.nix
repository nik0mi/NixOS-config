{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --time --cmd niri-session";
      user = "greeter";
    };
  };
}
