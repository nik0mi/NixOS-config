{ pkgs, ... }:

{
  imports = [
    ./plugins/chmod.nix
    ./plugins/sudo.nix
    ./plugins/mediainfo.nix
    ./plugins/ouch.nix
    ./plugins/gvfs.nix
    ./plugins/copy-file-contents.nix
  ];
  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    initLua = ./init.lua;

    plugins = {
      "chmod" = pkgs.yaziPlugins.chmod;
      "sudo" = pkgs.yaziPlugins.sudo;
      "mediainfo" = pkgs.yaziPlugins.mediainfo;
      "ouch" = pkgs.yaziPlugins.ouch;
      "full-border" = pkgs.yaziPlugins.full-border;

      "gvfs" = ./plugins/gvfs.yazi;
      "copy-file-contents" = ./plugins/copy-file-contents.yazi;
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "g"
            "m"
          ];
          run = "cd ~/.mine";
          desc = "Go ~/.mine";
        }
        {
          on = [
            "g"
            "u"
          ];
          run = "cd /run/media/ovce";
          desc = "Go to USB-drives";
        }
      ];
    };

    settings = {
      open = {
        prepend_rules = [
          {
            name = "*.osz";
            use = [ "osu_game" ];
          }
        ];

        rules = [
            { mime = "image/*"; use = "qimgv"; }
            { name = "*.jpg"; use = "qimgv"; }
            { name = "*.jpeg"; use = "qimgv"; }
            { name = "*.png"; use = "qimgv"; }
            { name = "*.gif"; use = "qimgv"; }
            { name = "*.webp"; use = "qimgv"; }
            { name = "*.bmp"; use = "qimgv"; }
            { name = "*.svg"; use = "qimgv"; }
        ];
      };

      opener = {
        edit = [
          {
            run = "zellij --layout helix";
            block = true;
            desc = "Helix + Zellij setup ";
          }
        ];
        "osu_game" = [
          {
            run = "osu! \"$@\"";
            for = "unix";
            desc = "Open with osu!";
          }
        ];
      };
    };
  };
}
