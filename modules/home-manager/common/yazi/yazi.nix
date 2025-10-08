{ ... }:

{
  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
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
    };
  };
}
