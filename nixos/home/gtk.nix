{ pkgs, ... }: {
  gtk = {
    enable = true;
     
    theme.name = "Colloid-Dark-Tokyonight";
    iconTheme.name = "Colloid-Dark";
    cursorTheme.name = "Colloid-cursors";
      
    font = {
      name = "Inter";
      package = pkgs.inter;
      size = 10.5;
    };
  };
}
