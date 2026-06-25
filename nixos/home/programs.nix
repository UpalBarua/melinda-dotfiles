{ pkgs, ... }: {
  programs = {
    hyprshot.enable = true;
    hyprlock.enable = true;
    zathura.enable = true;
    lf.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    sesh.enable = true;
    obsidian.enable = true;
    jq.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    alacritty.enable = true;
    anki.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    gh.enable = true;
    firefox.enable = true;

    swayimg = {
      enable = true;
      settings = {
        viewer = {
          window = "#191724";
        };
      };
    };

    rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-emoji
        rofi-calc
      ];
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    opencode = {
      enable = true;
      settings = {
        mcp = {
          chrome-devtools = {
            type = "local";
            command = [
              "npx"
              "-y"
              "chrome-devtools-mcp@latest"
            ];
          };
        };
      };
    };
  };
}
