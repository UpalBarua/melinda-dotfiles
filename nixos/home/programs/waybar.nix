{ pkgs, ... }:
let
  dual-battery-module = import ./scripts/dual-battery-module.nix { inherit pkgs; };
in
{
  programs.waybar = {
    enable = false;
    settings = {
      sway = {
        layer = "top";
        position = "top";
        spacing = 15;
        modules-left = [
          "sway/workspaces"
          "temperature"
          "cpu"
          "memory"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "backlight"
          "pulseaudio"
          "network"
          "custom/battery"
          "tray"
        ];
        "sway/workspaces" = {
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 muted";
          tooltip = false;
          format-icons = {
            headphone = "󰋋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
        };

        "network" = {
          format-wifi = "󰖩 {bandwidthDownBytes}";
          format-disconnected = "󰖪  No Internet";
          interval = 2;
          tooltip = false;
        };

        "temperature" = {
          format = " {temperatureC}°C";
          tooltip = false;
        };

        "backlight" = {
          interval = "once";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃚"
            "󰃛"
            "󰃜"
            "󰃝"
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          tooltip = false;
        };

        "clock" = {
          format = "{:%a %b %d / %I:%M %p}";
          tooltip = false;
        };

        "memory" = {
          interval = 10;
          format = "󰍛 {used:0.1f}G";
          tooltip = false;
        };

        "cpu" = {
          interval = 10;
          format = "󰓅 {usage}%";
          tooltip = false;
        };

        "custom/battery" = {
          exec = "${dual-battery-module}/bin/dual-battery-module";
          return-type = "json";
          interval = 60;
          format = "{icon} {text}";
          format-icons = {
            discharging = [
              ""
              ""
              ""
              ""
              ""
            ];
            charging = "󱊦";
          };
        };

        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
          tooltip = false;
        };
      };
    };

    style = ''
      @define-color background #1a1b26;
      @define-color foreground #c0caf5;
      @define-color accent #7aa2f7;
      @define-color secondary #292e42;

      * {
        all: unset;
        margin: 0;
        padding: 0;
        min-height: 0;
        border: none;
        border-radius: 0;
        font-family: "CaskaydiaCove Nerd Font Propo";
        font-size: 11.5px;
        font-weight: bold;
      }

      window#waybar > box {
        background-color: @background;
        color: @foreground;
        padding: 0.65em;
      }

      #workspaces button {
        padding: 0.25em 0.5em;
        margin: 0 0.25em;
        border-radius: 1.5px;
        background-color: @background;
      }

      #workspaces button.empty {
        background-color: @background;
      }

      #workspaces button.active {
        background-color: @accent;
        color: @background;
      }
    '';
  };
}
