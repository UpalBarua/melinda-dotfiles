{ lib, pkgs, ... }:
let
  mod = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  menu = "${pkgs.rofi}/bin/rofi";
  terminal = "${pkgs.kitty}/bin/kitty --single-instance";
  browser = "${pkgs.brave}/bin/brave";

  theme = {
    bg = "#1a1b26";
    fg = "#c0caf5";
    accent = "#7aa2f7";
    secondary = "#414868";
    urgent = "#f7768e";
  };
in
{
  wayland.windowManager.sway = {
    enable = false;
    config = {
      modifier = mod;
      input = {
        "type:pointer" = {
          accel_profile = "flat";
        };
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
          accel_profile = "flat";
        };
        "type:keyboard" = {
          xkb_layout = "us";
          repeat_delay = "300";
          repeat_rate = "40";
        };
      };
      output = {
        eDP-1 = {
          resolution = "1920x1080@60.02Hz";
          scale = "1.25";
          position = "0,0";
        };
        HDMI-A-2 = {
          resolution = "1366x768@59.79Hz";
          scale = "1";
          position = "1536,0";
        };
      };
      startup = [
        { command = "${pkgs.awww}/bin/awww-daemon"; }
        { command = "${pkgs.mako}/bin/mako"; }
        { command = "${pkgs.waybar}/bin/waybar"; }
        {
          command = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
        }
        {
          command = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
        }
        { command = "${pkgs.hypridle}/bin/hypridle"; }
      ];
      window = {
        titlebar = false;
        border = 2;
      };
      gaps = {
        top = 0;
        bottom = 0;
        left = 0;
        vertical = 0;
        horizontal = 0;
        right = 0;
        inner = 5;
        outer = 5;
      };
      bars = [
        # {
        #   id = "main";
        #   position = "top";
        #   statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
        #
        #   fonts = {
        #     size = 8.5;
        #     names = [
        #       "CaskaydiaCove Nerd Font Propo"
        #       "monospace"
        #     ];
        #     style = "Bold";
        #   };
        #
        #   colors = {
        #     background = theme.bg;
        #     statusline = theme.fg;
        #     separator = theme.secondary;
        #
        #     focusedBackground = theme.bg;
        #     focusedStatusline = theme.fg;
        #     focusedSeparator = theme.accent;
        #
        #     focusedWorkspace = {
        #       border = theme.accent;
        #       background = theme.accent;
        #       text = theme.bg;
        #     };
        #     activeWorkspace = {
        #       border = theme.bg;
        #       background = theme.bg;
        #       text = theme.fg;
        #     };
        #     inactiveWorkspace = {
        #       border = theme.bg;
        #       background = theme.bg;
        #       text = theme.fg;
        #     };
        #     urgentWorkspace = {
        #       border = theme.urgent;
        #       background = theme.urgent;
        #       text = theme.fg;
        #     };
        #     bindingMode = {
        #       border = theme.accent;
        #       background = theme.accent;
        #       text = theme.bg;
        #     };
        #   };
        #
        #   extraConfig = ''
        #     status_padding 5
        #   '';
        # }
      ];

      keybindings = lib.attrsets.mergeAttrsList [

        # Moving around:
        (lib.attrsets.concatMapAttrs
          (key: direction: {
            "${mod}+${key}" = "focus ${direction}";
            "${mod}+Shift+${key}" = "move ${direction}";
          })
          {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          }
        )

        # Workspaces:
        (lib.attrsets.mergeAttrsList (
          map
            (
              num:
              let
                ws = toString num;
              in
              {
                "${mod}+${ws}" = "workspace ${ws}";
                "${mod}+Ctrl+${ws}" = "move container to workspace ${ws}";
              }
            )
            [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              0
            ]
        ))

        {
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+Ctrl+B" = "exec ${browser}";
          "${mod}+Ctrl+O" = "exec ${pkgs.obsidian}/bin/obsidian";
          "${mod}+Ctrl+Shift+E" = "exec ${pkgs.thunar}/bin/thunar";

          "${mod}+Ctrl+E" = "exec ${terminal} -e ${pkgs.lf}/bin/lf";
          "${mod}+Ctrl+T" = "exec ${terminal} -e ${pkgs.btop}/bin/btop";

          "${mod}+Ctrl+W" = "exec ${browser} --app=https://web.whatsapp.com/";
          "${mod}+Ctrl+G" = "exec ${browser} --app=https://gemini.google.com/";
          "${mod}+Ctrl+P" = "exec ${browser} --app=https://phitron.io/dashboard";

          "${mod}+Shift+Q" = "kill";
          "${mod}+Shift+R" = "reload";

          "${mod}+D" = "exec ${menu} -show drun";
          "${mod}+E" = "exec ${menu} -show emoji -modi emoji";
          "${mod}+V" =
            "exec ${pkgs.cliphist}/bin/cliphist list | ${menu} -dmenu -p 'Clipboard' -display-columns 2 | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy ";
          "${mod}+Shift+T" = "exec ~/.config/rofi/scripts/rofi-quick-toggles.sh";
          "${mod}+Shift+M" = "exec ~/.config/rofi/scripts/rofi-music.sh";
          "${mod}+Escape" = "exec ~/.config/rofi/scripts/rofi-session.sh";

          # Layout stuff:
          "${mod}+Shift+B" = "split h";
          "${mod}+Shift+V" = "split v";
          "${mod}+Shift+E" = "layout toggle split";
          "${mod}+S" = "layout stacking";
          "${mod}+W" = "layout tabbed;";
          "${mod}+F" = "fullscreen";
          "${mod}+Shift+Space" = "floating toggle";
          "${mod}+Space" = "focus mode_toggle";
          "${mod}+A" = "focus parent";

          "${mod}+R" = "mode resize";

          # Scratchpad:
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+Minus" = "scratchpad show";

          # // === Volume and Brightness ===
          "${mod}+bracketright" = "exec volume.sh -i";
          "${mod}+bracketleft" = "exec volume.sh -d";
          "${mod}+backslash" = "exec volume.sh -m";
          "${mod}+Shift+bracketright" = "exec brightness.sh -i";
          "${mod}+Shift+bracketleft" = "exec brightness.sh -d";

          "Print" =
            "exec hyprshot -m active -m output -o ~/Pictures/screenshots -f screenshot-$(date +%Y-%m-%d-%H-%M-%S).png";
          "Shift+Print" =
            "exec hyprshot -m region -o ~/Pictures/screenshots -f screenshot-$(date +%Y-%m-%d-%H-%M-%S).png";
          "${mod}+Print" = "exec hyprpicker -a -n";
          "${mod}+Shift+Print" =
            "exec hyprshot -m region -o ~/Pictures/screenshots -f screenshot-$(date +%Y-%m-%d-%H-%M-%S).png";

          "${mod}+Ctrl+Space" = "exec awww-randbg.sh";
        }
      ];
      modes = {
        resize = {
          # Binds arrow keys to resizing commands
          "${left}" = "resize shrink width 20 px";
          "${down}" = "resize grow height 20 px";
          "${up}" = "resize shrink height 20 px";
          "${right}" = "resize grow width 20 px";

          # Exit resize mode
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };

      colors = {
        background = theme.bg;

        focused = {
          border = theme.accent;
          background = theme.bg;
          childBorder = theme.accent;
          indicator = theme.accent;
          text = theme.fg;
        };

        focusedInactive = {
          border = theme.secondary;
          background = theme.bg;
          childBorder = theme.secondary;
          indicator = theme.secondary;
          text = theme.fg;
        };

        unfocused = {
          border = theme.secondary;
          background = theme.bg;
          childBorder = theme.secondary;
          indicator = theme.secondary;
          text = theme.fg;
        };

        urgent = {
          border = theme.urgent;
          background = theme.bg;
          childBorder = theme.urgent;
          indicator = theme.urgent;
          text = theme.fg;
        };

        placeholder = {
          border = theme.accent;
          background = theme.bg;
          childBorder = theme.accent;
          indicator = theme.accent;
          text = theme.fg;
        };
      };
    };
  };

  programs.i3status-rust = {
    enable = false;
    bars = {
      default = {
        icons = "awesome6";
        settings = {
          theme = {
            overrides = {
              separator = "";
              idle_bg = theme.bg;
              idle_fg = theme.fg;
              separatorBg = theme.bg;
            };
          };
        };
        blocks = [
          {
            block = "battery";
            format = " $percentage ";
            device = "DisplayDevice";
            driver = "upower";
          }
          {
            block = "net";
            format = " $icon ";
          }
          {
            block = "sound";
            format = " $icon ";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %b %d %I:%M %p') ";
            interval = 60;
          }
        ];
      };
    };
  };
}
