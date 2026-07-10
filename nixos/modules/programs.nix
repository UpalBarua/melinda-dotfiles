{ pkgs, ... }: {
  programs = {
    zsh.enable = true;
    niri.enable = true;
    localsend.enable = true;
    obs-studio.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-media-tags-plugin
        thunar-archive-plugin
        thunar-volman
      ];
    };

    nix-ld.enable = true;
    nix-ld.libraries = [ ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    gcc
    ntfs3g
    xwayland-satellite
    android-studio
    scrcpy
    android-tools
  ];
}
