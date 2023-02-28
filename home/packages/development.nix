{
  pkgs,
  lib,
  stdenv,
  ...
}: let
  inherit (pkgs) stdenv;

  rust_pkgs = with pkgs; [
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly
  ];

  node_pkgs = with pkgs; [
    nodejs-16_x
    tree-sitter
    pkgs.nodePackages.neovim
    pkgs.nodePackages.ts-node
  ];

  python_pkgs = with pkgs; [
    python3
    pkgs.python3Packages.pynvim
    poetry
  ];

  cf-tool = stdenv.mkDerivation {
    pname = "cf";
    version = "1.0.0";

    src = pkgs.fetchzip {
      name = "cf";
      url = "https://github.com/xalanq/cf-tool/releases/download/v1.0.0/cf_v1.0.0_linux_64.zip";
      sha256 = "sha256-+losFMckuAq+H8dGs1+hqD124665TrX8LKkdWIucM0U=";
    };

    nativeBuildInptus = [];
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      cp -r cf $out/bin
    '';

    meta = with lib; {
      homepage = "https://github.com/xalanq/cf-tool";
      description = "CodeForces CLI";
      sourceProvenance = with sourceTypes; [binaryBytecode];
      license =  [];
      platforms = platforms.all;
      maintainers =  [];
    };
  };
in
  with pkgs;
    [
      gh
      lazygit
      hugo
      cf-tool
      commitizen
      renderdoc
      gnumake
      dbeaver
      glibc
      mkdocs
      postman
      tldr
      wine
    ]
    ++ node_pkgs
    ++ python_pkgs
    ++ rust_pkgs
