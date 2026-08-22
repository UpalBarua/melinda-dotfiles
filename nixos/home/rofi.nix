{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "CaskaydiaCove Nerd Font Propo 10.5";
    modes = [
      "window"
      "run"
      "drun"
      "filebrowser"
    ];
    terminal = "kitty";
    xoffset = 1900;
    extraConfig = {
      display-drun = "drun";
      display-window = "Windows";
      display-emoji = "Emojis";
      display-clipboard = "Clipboard";
      drun-display-format = "{name}";

      kb-row-up = "Up,Control+k,Shift+Tab,Shift+ISO_Left_Tab";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-remove-to-eol = "Control+Shift+e";
      kb-mode-next = "Shift+Right,Control+Tab";
      kb-mode-previous = "Shift+Left,Control+Shift+Tab";
      kb-remove-char-back = "BackSpace";
    };
    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          background = mkLiteral "#1a1b26";
          foreground = mkLiteral "#c0caf5";
          accent = mkLiteral "#7aa2f7";
          secondary = mkLiteral "#292e42";

          border = 0;
          margin = 0;
          padding = 0;
          spacing = 0;

          text-color = mkLiteral "@foreground";
          background-color = mkLiteral "transparent";
        };

        window = {
          width = mkLiteral "40em";
          border = mkLiteral "2px";
          padding = mkLiteral "0.75em";
          border-color = mkLiteral "@accent";
          background-color = mkLiteral "@background";
        };

        element = {
          padding = mkLiteral "0.5em 0.75em";
        };

        "element selected" = {
          background-color = mkLiteral "@accent";
       };

        "element-text selected" = {
          text-color = mkLiteral "@background";
        };

        "element-text" = {
          vertical-align = mkLiteral "0.5";
        };

        "element-icon" = {
          size = 24;
          padding = mkLiteral "0 0.5em 0 0";
        };

        inputbar = {
          padding = mkLiteral "0.5em 0.75em 1em";
          children = mkLiteral "[prompt, entry]";
        };

        entry = {
          vertical-align = mkLiteral "0.5";
          border-radius = 0;
        };

        listview = {
          columns = 1;
          # lines = 8;
        };

        mainbox = {
          children = mkLiteral "[inputbar, listview]";
        };

        prompt = {
          vertical-align = "0.5";
          text-color = mkLiteral "@accent";
          padding = mkLiteral "0 0.5em 0 0";
        };
      };
  };
}
