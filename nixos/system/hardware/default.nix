{ ... }: {
  imports = [
    ./file-systems.nix
    ./bluetooth.nix
    ./intel.nix
    ./networking.nix
    ./zram.nix
  ];
}

