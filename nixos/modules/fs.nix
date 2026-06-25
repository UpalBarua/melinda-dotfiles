{ ... }: {
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
}
