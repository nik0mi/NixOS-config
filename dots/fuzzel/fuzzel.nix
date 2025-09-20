{ ... } :

{
  home.file = {
    "/.config/fuzzel" = {
      source = ../fuzzel;
      recursive = true;
    };
  };
  stylix.targets.fuzzel.enable = true;
}
