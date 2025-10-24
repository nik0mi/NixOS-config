{ ... }:

{
  programs.yazi.settings.plugin.prepend_preloaders = [
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

  programs.yazi.settings.plugin.prepend_previewers = [
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
}
