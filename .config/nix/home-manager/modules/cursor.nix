{pkgs, ...}: {
  home.pointerCursor = {
    name = "capitaine-cursors";

    package = pkgs.capitaine-cursors;

    size = 32;

    gtk.enable = true;
    hyprcursor.enable = true;
  };
}
