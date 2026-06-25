{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    git
    gcc
    ntfs3g
  ];

  programs.zsh.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-media-tags-plugin
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
