{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.iosevka
      dejavu_fonts
      liberation_ttf
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Serif Bengali"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans Bengali"
        ];
        monospace = [ "Noto Sans Mono" ];
      };

      antialias = true;
      useEmbeddedBitmaps = false;

      hinting = {
        enable = true;
        autohint = false;
        style = "slight";
      };

      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };
}
