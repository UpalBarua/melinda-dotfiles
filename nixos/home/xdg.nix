{ ... }: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      projects = "$HOME/Projects";
      desktop = null;
      documents = null;
      templates = null;
      videos = null;
      publicShare = null;
    };
    portal.config = {
      niri = {
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };
}
