{ pkgs, ... }: {
  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };

  environment.systemPackages = [
    pkgs.inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
