{ ... }: {
  nix = {
    optimise.automatic = true;
    settings.trusted-users = [
      "root"
      "upal"
    ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };
}
