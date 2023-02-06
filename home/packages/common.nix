{pkgs,lib, ...}: let
  inherit (pkgs) stdenv;
in
  with pkgs; [
    zathura
    exa
    ripgrep
    picom
    brave
    google-chrome-dev

    pass
    qbittorrent
  ]
