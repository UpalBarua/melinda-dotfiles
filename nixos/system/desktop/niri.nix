{ pkgs, inputs, ... }: {
  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
