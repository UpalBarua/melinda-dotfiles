{ ... }: {
  services.fstrim.enable = true;
  services.interception-tools.enable = true;
  services.tumbler.enable = true;
  services.xserver.xkb.layout = "us";
  services.gvfs.enable = true;
}
