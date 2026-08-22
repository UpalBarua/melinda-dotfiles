{ ... }: {
  imports = [
    ./services.nix
    ./ssh.nix
    ./xdg.nix
    ./gtk.nix
    ./programs/defaults.nix
  ];
}
