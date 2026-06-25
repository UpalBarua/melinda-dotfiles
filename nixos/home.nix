{ ... }:
{
  imports = [
    ./home/services.nix
    ./home/ssh.nix
    ./home/xdg.nix
    ./home/gtk.nix
    ./home/programs.nix
    ./home/pkgs.nix
    ./home/neovim.nix
  ];

  home = {
    username = "upal";
    homeDirectory = "/home/upal";
    stateVersion = "26.05";

    file = {
      # Configs
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

      ".gitconfig".source = ../.gitconfig;
      ".zshrc".source = ../.zshrc;
      ".zshenv".source = ../.zshenv;

      # Scripts
      ".local/bin/img2webp".source = ../bin/img2webp;
      ".local/bin/vimv".source = ../bin/vimv;
      ".local/bin/brightness.sh".source = ../bin/brightness.sh;
      ".local/bin/volume.sh".source = ../bin/volume.sh;
      ".local/bin/awww-randbg.sh".source = ../bin/wallpapers/awww-randbg.sh;
    };
  };
}
