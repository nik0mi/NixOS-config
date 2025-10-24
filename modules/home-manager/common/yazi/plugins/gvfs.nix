{ ... }:

{
  programs.yazi.keymap.mgr.prepend_keymap = [
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
  ];
}
