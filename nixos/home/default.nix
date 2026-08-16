{ ... }: {
  imports = [
    ./services.nix
    ./ssh.nix
    ./xdg.nix
    ./gtk.nix
    ./programs.nix
    ./sway.nix
  ];
}
