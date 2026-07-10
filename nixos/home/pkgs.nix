{ pkgs, ... }: {
  home.packages = with pkgs; [
    htop
    brave
    kitty
    waybar
    brightnessctl
    git-extras
    mate-polkit
    wtype
    ripgrep
    ouch
    openbangla-keyboard
    nwg-look
    wl-clipboard
    google-chrome
    hyprpicker
    awww
    trash-cli
    vscodium
    nodejs
    pnpm
    man-db
    bluetui
    ffmpegthumbnailer
    mediainfo
    pavucontrol
    fastfetch
    libnotify
    transmission_4
    zinit
    file
    hypridle
    tmux
    ripdrag
    unzip
    poppler-utils
    lf

    # Neovim with LSPs and formatters
    neovim
    lua51Packages.tree-sitter-cli
    lua-language-server
    typescript-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    emmet-language-server
    clang-tools
    nil
    basedpyright
    hyprls
    stylua
    ruff
    prettierd
    eslint_d
    nixfmt
    bash-language-server
    shfmt
    kdlfmt

    (rofi.override {
      plugins = with pkgs; [
        rofi-emoji
        rofi-calc
      ];
    })

    zathura
    zathuraPkgs.zathura_pdf_mupdf
  ];
}
