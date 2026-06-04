{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;

  # Latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.cpu.intel.updateMicrocode = true;

  # Graphics drivers
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  networking.hostName = "melinda";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.iosevka
    dejavu_fonts
    liberation_ttf
  ];

  services.fstrim.enable = true;

  # Sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  programs.zsh.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-media-tags-plugin
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.interception-tools.enable = true;
  services.tumbler.enable = true;
  services.xserver.xkb.layout = "us";
  services.gvfs.enable = true;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };

      battery = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    priority = 100;
  };

  # User account
  users.users.upal = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    ntfs3g
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/39CF3CB4265798B7";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "fmask=007"
      "dmask=007"
      "nofail"
    ];
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  nix.optimise.automatic = true;

  # Do NOT change this value
  system.stateVersion = "25.11";
}
