{ pkgs, ... }:

{
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
      "smart-enter" = pkgs.yaziPlugins.smart-enter;
      "smart-paste" = pkgs.yaziPlugins.smart-paste;

      "gvfs" = ./plugins/gvfs.yazi;
      "copy-file-contents" = ./plugins/copy-file-contents.yazi;
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "<C-n>" ];
          run = "shell 'ripdrag \"$@\" -x 2>/dev/null &' --confirm";
        }
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

        # smart-enter plugin
        {
          on = [ "p" ];
          run = "plugin smart-paste";
          desc = "Paste into the hovered directory or CWD";
        }

        # smart-paste plugin
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }

        # chmod plugin
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }

        # gvfs plugin
        {
          on = [
            "M"
            "m"
          ];
          run = "plugin gvfs -- select-then-mount --jump";
          desc = "Select device to mount and jump to its mount point";
        }
        {
          on = [
            "M"
            "u"
          ];
          run = "plugin gvfs -- select-then-unmount --eject";
          desc = "Select device then eject";
        }
        {
          on = [
            "M"
            "U"
          ];
          run = "plugin gvfs -- select-then-unmount --eject --force";
          desc = "Select device then force to eject/unmount";
        }
        {
          on = [
            "M"
            "a"
          ];
          run = "plugin gvfs -- add-mount";
          desc = "Add a GVFS mount URI";
        }
        {
          on = [
            "M"
            "e"
          ];
          run = "plugin gvfs -- edit-mount";
          desc = "Edit a GVFS mount URI";
        }
        {
          on = [
            "M"
            "r"
          ];
          run = "plugin gvfs -- remove-mount";
          desc = "Remove a GVFS mount URI";
        }
        {
          on = [
            "M"
            "j"
          ];
          run = "plugin gvfs -- jump-to-device";
          desc = "Select device then jump to its mount point";
        }
        {
          on = [
            "M"
            "R"
          ];
          run = "plugin gvfs -- remount-current-cwd-device";
          desc = "Remount device under cwd";
        }
        {
          on = [
            "M"
            "b"
          ];
          run = "plugin gvfs -- jump-back-prev-cwd";
          desc = "Jump back to the position before jumped to device";
        }

        # copy-file-contents plugin
        {
          on = [
            "c"
            "i"
          ];
          run = [ "plugin copy-file-contents" ];
          desc = "Copy contents of file";
        }

        {
          on = [ "C" ];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
      ];
      manager.keymap = [
        {
          on = [
            "R"
            "D"
          ];
          run = "plugin sudo -- remove --permanently";
          desc = "sudo delete";
        }
        {
          on = [
            "R"
            "d"
          ];
          run = "plugin sudo -- remove";
          desc = "sudo trash";
        }
        {
          on = [
            "R"
            "a"
          ];
          run = "plugin sudo -- create";
          desc = "sudo create";
        }
        {
          on = [
            "R"
            "r"
          ];
          run = "plugin sudo -- rename";
          desc = "sudo rename";
        }
        {
          on = [
            "R"
            "p"
          ];
          run = "plugin sudo -- paste";
          desc = "sudo paste";
        }
      ];
    };

    settings = {
      plugin.prepend_preloaders = [
        {
          mime = "{audio,video,image}/*";
          run = "mediainfo";
        }
        {
          mime = "application/subrip";
          run = "mediainfo";
        }
        {
          mime = "application/postscript";
          run = "mediainfo";
        }
        {
          name = "/run/user/1000/gvfs/**/*";
          run = "noop";
        }
        {
          name = "/run/media/ovce/**/*";
          run = "noop";
        }
      ];

      plugin.prepend_previewers = [
        {
          mime = "{audio,video,image}/*";
          run = "mediainfo";
        }
        {
          mime = "application/subrip";
          run = "mediainfo";
        }
        {
          mime = "application/postscript";
          run = "mediainfo";
        }

        {
          mime = "application/*zip";
          run = "ouch";
        }
        {
          mime = "application/x-tar";
          run = "ouch";
        }
        {
          mime = "application/x-bzip2";
          run = "ouch";
        }
        {
          mime = "application/x-7z-compressed";
          run = "ouch";
        }
        {
          mime = "application/x-rar";
          run = "ouch";
        }
        {
          mime = "application/vnd.rar";
          run = "ouch";
        }
        {
          mime = "application/x-xz";
          run = "ouch";
        }
        {
          mime = "application/xz";
          run = "ouch";
        }
        {
          mime = "application/x-zstd";
          run = "ouch";
        }
        {
          mime = "application/zstd";
          run = "ouch";
        }
        {
          mime = "application/java-archive";
          run = "ouch";
        }

        {
          name = "*/";
          run = "folder";
        }
        {
          name = "/run/user/1000/gvfs/**/*";
          run = "noop";
        }
        {
          name = "/run/media/ovce/**/*";
          run = "noop";
        }
      ];
      opener.text = [
        {
          run = "hx \"$@\"";
        }
      ];
      opener.editor = [
        {
          run = "hx \"$@\"";
        }
      ];
      opener.extract = [
        {
          run = "ouch d -y \"$@\"";
          desc = "Extract here with ouch";
          for = "unix";
        }
      ];
    };
  };
}
