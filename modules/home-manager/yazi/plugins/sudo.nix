{ ... }:

{
  programs.yazi.keymap.manager.keymap = [
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
}
