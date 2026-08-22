{ pkgs, inputs, ... }: {
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };

  xdg.portal.config = {
    niri = {
      "org.freedesktop.impl.portal.FileChooser" = "gtk";
    };
  };
}
