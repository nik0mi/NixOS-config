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

          {
            mime = "text/*";
            use = [ "edit" ];
          }
        ];
        rules = [
          {
            mime = "image/*";
            use = "qimgv";
          }
          {
            name = "*";
            use = "open";
          }
        ];
      };

      opener = {
        "osu_game" = [
          {
            run = "osu! \"$@\"";
            for = "unix";
            desc = "Open with osu!";
          }
        ];
        qimgv = [
          {
            run = "qimgv \"$@\"";
            orphan = true;
            desc = "Open with qimgv";
          }
        ];
        edit = [
          {
            run = "zellij --layout helix";
            block = true;
            desc = "Open with helix";
          }
        ];
        open = [
          {
            run = "xdg-open \"$@\"";
            desc = "Open";
            for = "unix";
          }
        ];
      };
    };
  };
}
