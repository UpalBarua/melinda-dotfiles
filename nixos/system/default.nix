{
  ...
}:
{
  imports = [
    ../system/core/nix.nix
    ../system/core/boot.nix
    ../system/core/users.nix
    ../system/core/networking.nix

    ../system/hardware/fs.nix
    ../system/hardware/zram.nix
    ../system/hardware/intel.nix
    ../system/hardware/bluetooth.nix
    ../system/hardware/auto-cpufreq.nix

    ../system/profiles/audio.nix
    ../system/profiles/fonts.nix
    ../system/profiles/programs.nix
    ../system/profiles/services.nix
  ];
}
