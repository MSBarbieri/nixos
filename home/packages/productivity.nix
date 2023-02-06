{pkgs, ...}: let
  inherit (pkgs) stdenv;
in
  with pkgs; [
    obsidian
    taskwarrior
    taskwarrior-tui
    translate-shell
  ]
