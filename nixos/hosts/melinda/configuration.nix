{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../system/default.nix
  ];

  time.timeZone = "Asia/Dhaka";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;
  system.stateVersion = "25.11"; # WARNING: DO NOT CHANGE THIS VALUE
}
