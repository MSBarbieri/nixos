{
  pkgs,
  lib,
  stdenv,
  ...
}: (import ./common.nix {inherit pkgs;})
  ++ (import ./development.nix {inherit pkgs lib stdenv;})
  ++ (import ./graphics.nix {inherit pkgs;})
  ++ (import ./media.nix {inherit pkgs;})
  ++ (import ./social.nix {inherit pkgs;})
  ++ (import ./productivity.nix {inherit pkgs;})
