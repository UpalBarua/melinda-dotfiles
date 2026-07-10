{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/intel.nix
    ./modules/fs.nix
    ./modules/services.nix
    ./modules/networking.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/users.nix
    ./modules/auto-cpufreq.nix
    ./modules/programs.nix
    ./modules/zram.nix
    ./modules/bluetooth.nix
  ];

  time.timeZone = "Asia/Dhaka";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;
  system.stateVersion = "25.11"; # WARNING: DO NOT CHANGE THIS VALUE
}
