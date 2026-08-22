{ pkgs, ... }: {
  imports = [
    ./sway.nix
    ./rofi.nix
    ./waybar.nix
    ./nvim.nix
  ];

  programs = {
    jq.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    lazygit.enable = true;
    sesh.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    gh.enable = true;

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    alacritty.enable = true;
    mpv.enable = true;
    obsidian.enable = true;
    anki.enable = true;
    firefox.enable = true;
    swayimg.enable = true;
    hyprshot.enable = true;
    hyprlock.enable = true;

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

  home.packages = with pkgs; [
    kitty
    brave
    google-chrome
    mate-polkit
    nwg-look
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    openbangla-keyboard
    ibus

    vscodium
    transmission_4
    pavucontrol

    htop
    brightnessctl
    git-extras
    wtype
    ripgrep
    ouch
    wl-clipboard
    awww
    trash-cli
    nodejs
    python3
    luarocks
    sqlite
    lua5_1
    pnpm
    man-db
    ffmpegthumbnailer
    mediainfo
    fastfetch
    libnotify
    file
    lua51Packages.tree-sitter-cli
    xwayland-satellite
    gnumake

    scrcpy
    hypridle
    hyprpicker
    tmux
    bluetui
    lf
    ripdrag
    unzip
    poppler-utils
    arduino-ide
  ];
}
