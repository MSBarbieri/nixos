{pkgs, ...}: let
  inherit (pkgs) stdenv;
  pidgin = pkgs.pidgin.override {
    ## Add whatever plugins are desired (see nixos.org package listing).
    plugins = [ 
      pkgs.pidgin-otr
      pkgs.purple-slack
      pkgs.purple-discord
      pkgs.purple-matrix
    ];
  };
in
  with pkgs; [
    discord
    fluent-reader
    element-desktop
    pidgin
  ]
