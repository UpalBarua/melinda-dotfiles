{ inputs, pkgs, ... }: {
  programs = {
    zsh.enable = true;
    localsend.enable = true;
    obs-studio.enable = true;

    niri = {
      enable = true;
      useNautilus = false;
    };

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
    neovim
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
