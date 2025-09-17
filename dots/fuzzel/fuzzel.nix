{ ... } :

{
  home.file = {
    "/.config/fuzzel" = {
      source = ../dots/fuzzel;
      recursive = true;
    };
  };
  stylix.targets.fuzzel.enable = true;
}
