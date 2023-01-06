{pkgs, ...}: let
  inherit (pkgs) stdenv;
in
  with pkgs; [
    xdg-utils
    rofi
    i3lock-color
    picom
    pkgs.gnome.nautilus
    pkgs.gnome.nautilus-python
    glava
  ]
