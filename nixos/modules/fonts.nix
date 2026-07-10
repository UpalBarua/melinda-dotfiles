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
      nerd-fonts.caskaydia-cove
      dejavu_fonts
      liberation_ttf
      ubuntu-sans
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        serif = [
          "Ubuntu Serif"
          "Noto Serif"
          "Noto Serif Bengali"
        ];
        sansSerif = [
          "Ubuntu Sans"
          "Noto Sans"
          "Noto Sans Bengali"
        ];
        monospace = [
          "CaskaydiaCove Nerd Font"
          "Noto Sans Mono"
        ];
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
