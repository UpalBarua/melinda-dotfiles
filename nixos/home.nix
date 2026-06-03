{ config, pkgs, ... }:

{
  home.username = "upal";
  home.homeDirectory = "/home/upal";
  home.stateVersion = "26.05";

  programs.hyprshot.enable = true;
  programs.hyprlock.enable = true;
  programs.zathura.enable = true;

  programs.lf.enable = true;
  programs.lazygit.enable = true;
  programs.mpv.enable = true;

  programs.sesh.enable = true;
  programs.fzf.tmux.enableShellIntegration = true;

  programs.swayimg.enable = true;
  programs.rofi.enable = true;
  programs.obsidian.enable = true;
  programs.jq.enable = true;

  programs.starship.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.alacritty.enable = true;
  programs.anki.enable = true;
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.gh.enable = true;
  programs.firefox.enable = true;

  programs.opencode = {
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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "yes";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };

    extraConfig = ''
      Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
    '';
  };

  services.ssh-agent.enable = true;

  services.cliphist.enable = true;
  services.mako.enable = true;

  home.packages = with pkgs; [
    htop
    brave
    kitty
    waybar
    rofi-emoji
    rofi-calc
    lua51Packages.tree-sitter-cli
    brightnessctl
    git-extras
    mate-polkit
    zathuraPkgs.zathura_pdf_mupdf
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

    # lf
    unzip
    poppler-utils
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      typescript-language-server
      tailwindcss-language-server
      vscode-langservers-extracted
      emmet-language-server
      clang-tools
      nil
      basedpyright
      vscode-css-languageserver
      hyprls
      stylua
      ruff
      prettierd
      eslint_d
      nixfmt
    ];
  };

  gtk = {
    enable = true;

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };

    font = {
      name = "Roboto";
      package = pkgs.roboto;
      size = 10;
    };

    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
  };

  xdg.userDirs = {
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

  home.file = {
    ".config/alacritty".source = ../.config/alacritty;
    ".config/bat".source = ../.config/bat;
    ".config/btop".source = ../.config/btop;
    ".config/nvim".source = ../.config/nvim;
    ".config/hypr".source = ../.config/hypr;
    ".config/kitty".source = ../.config/kitty;
    ".config/lazygit".source = ../.config/lazygit;
    ".config/lf".source = ../.config/lf;
    ".config/mako".source = ../.config/mako;
    ".config/mpv".source = ../.config/mpv;
    ".config/rofi".source = ../.config/rofi;
    ".config/waybar".source = ../.config/waybar;
    ".config/zathura".source = ../.config/zathura;
    ".config/tmux".source = ../.config/tmux;
    ".config/starship.toml".source = ../.config/starship.toml;
    ".config/mimeapps.list".source = ../.config/mimeapps.list;

    ".zshrc".source = ../.zshrc;
    ".zshenv".source = ../.zshenv;

    # Scripts
    ".local/bin/img2webp".source = ../bin/img2webp;
    ".local/bin/vimv".source = ../bin/vimv;
    ".local/bin/brightness.sh".source = ../bin/brightness.sh;
    ".local/bin/volume.sh".source = ../bin/volume.sh;
    ".local/bin/awww-randbg.sh".source = ../bin/wallpapers/awww-randbg.sh;
  };
}
