{ ... }: {
  services.xserver.xkb.layout = "us";
  services.fstrim.enable = true;
  services.interception-tools.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
}
