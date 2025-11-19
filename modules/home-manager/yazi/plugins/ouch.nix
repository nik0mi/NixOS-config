{ ... }:

{
  programs.yazi.settings.opener.extract = [
    {
      run = "ouch d -y \"$@\"";
      desc = "Extract here with ouch";
      for = "unix";
    }
  ];

  programs.yazi.settings.open.prepend_rules = [
    {
      mime = "application/{,g}zip";
      use = [ "extract" ];
    }
    {
      mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
      use = [ "extract" ];
    }
  ];

  programs.yazi.settings.plugin.prepend_previewers = [
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
  ];
}
