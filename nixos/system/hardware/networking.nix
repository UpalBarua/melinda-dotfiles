{ ... }: {
  networking = {
    hostName = "melinda";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        3000
        8081
        4096
      ];
    };
  };
}
