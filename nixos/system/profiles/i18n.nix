{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus = {
      waylandFrontend = true;
      engines = with pkgs; [
        # openbangla-keyboard
      ];
    };
  };

  # 2. Ensure IBus is started in your graphical session
  # services.dbus.enable = true;

  # environment.variables.GTK_IM_MODULE = "ibus";
  # environment.variables.QT_IM_MODULE = "ibus";
  # environment.variables.XMODIFIERS = "@im=ibus";

  # environment.variables.GTK_IM_MODULE = "wayland";
  # environment.variables.XMODIFIERS = "@im=ibus";
  # environment.variables.QT_IM_MODULES = "wayland;ibus";
  # environment.variables.QT_IM_MODULE = "ibus";
}
