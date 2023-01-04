{pkgs, ...}: let
  inherit (pkgs) stdenv;
in
  with pkgs; [
    vlc
    pulsemixer
    playerctl
    spotify-tui
    mpv
    spotify
  ]
