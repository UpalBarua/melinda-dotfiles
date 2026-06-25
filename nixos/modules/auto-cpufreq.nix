{ ... }: {
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
}
