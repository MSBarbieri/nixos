{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;

  node_pkgs = with pkgs; [
    nodejs
    yarn
    yarn2nix
    tree-sitter
    pkgs.nodePackages.neovim
    pkgs.nodePackages.ts-node
  ];

  python_pkgs = with pkgs; [
    python3
    pkgs.python3Packages.pynvim
    pkgs.python3Packages.pytest
    pkgs.python3Packages.pyflakes
    pkgs.python3Packages.black
    pkgs.python3Packages.setuptools
    pkgs.python3Packages.pip
    pkgs.python3Packages.pygobject3
    pkgs.python3Packages.gst-python
    poetry
  ];
in
  with pkgs;
    [
      gh
      lazygit
      hugo
    ]
    ++ node_pkgs
    ++ python_pkgs
