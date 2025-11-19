{ ... }:

{
  programs.yazi.keymap.mgr.prepend_keymap = [
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
}
