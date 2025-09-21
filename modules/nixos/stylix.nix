{ config, pkgs, ... }:

{
  stylix.enable = true;

  stylix.cursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Dark";
    size = 24;
  };

  stylix.base16Scheme = {
    base00 = "3f4738"; #3f4738  # Default Background - Dark Grayish Olive
    base01 = "4c5844"; #4c5844  # Lighter Background - Welded Iron
    base02 = "59664f"; #59664f  # Selection Background
    base03 = "68745d"; #68745d  # Comments, Inactive
    base04 = "7a8570"; #7a8570  # Dark Foreground
    base05 = "c7d5c0"; #c7d5c0  # Default Foreground, Text
    base06 = "e0ead8"; #e0ead8  # Light Foreground
    base07 = "eff6ee"; #eff6ee  # Bright Foreground - Madder Blue (Light Background)
    base08 = "cc4455"; #cc4455  # Red - Errors, Deletion
    base09 = "d07a3c"; #d07a3c  # Orange - Warnings, Numbers
    base0A = "968732"; #968732  # Yellow - Tijolo (Accent Color)
    base0B = "6a9e3d"; #6a9e3d  # Green - Success, Actions
    base0C = "3d8e9e"; #3d8e9e  # Cyan - Information
    base0D = "4a7cac"; #4a7cac  # Blue - Links, Primary Actions
    base0E = "8a6fac"; #8a6fac  # Magenta - Special
    base0F = "a36a4b"; #a36a4b  # Brown - Tags
  };

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
  };
}
