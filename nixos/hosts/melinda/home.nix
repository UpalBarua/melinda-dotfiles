{ config, ... }:
{
  imports = [
    ../../home/default.nix
  ];

  home = {
    username = "upal";
    homeDirectory = "/home/upal";
    stateVersion = "26.05"; # WARNING: DO NOT CHANGE THIS VALUE

    file = {
      # # Configs
      ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/alacritty";
      ".config/bat".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/bat";
      ".config/btop".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/btop";
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/nvim";
      ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/kitty";
      ".config/niri".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/niri";
      ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/hypr";
      ".config/lazygit".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/lazygit";
      ".config/lf".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/lf";
      ".config/mako".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/mako";
      ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/mpv";
      ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/zathura";
      ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/tmux";
      ".config/eza".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/eza";
      ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/starship.toml";
      ".config/mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.config/mimeapps.list";

      ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.gitconfig";
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.zshrc";
      ".zshenv".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/.zshenv";

      # Scripts
      ".local/bin/img2webp".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/bin/img2webp";
      ".local/bin/vimv".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/bin/vimv";
      ".local/bin/brightness.sh".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/bin/brightness.sh";
      ".local/bin/volume.sh".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/bin/volume.sh";
      ".local/bin/awww-randbg.sh".source = config.lib.file.mkOutOfStoreSymlink  "${config.home.homeDirectory}/.dotfiles/bin/wallpapers/awww-randbg.sh";
    };
  };
}
