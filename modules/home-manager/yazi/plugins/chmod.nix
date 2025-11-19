{ ... }:

{
  programs.yazi.keymap.mgr.prepend_keymap = [
    # chmod plugin
    {
      on = [
        "c"
        "m"
      ];
      run = "plugin chmod";
      desc = "Chmod on selected files";
    }
  ];
}
