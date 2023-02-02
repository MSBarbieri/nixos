{
  pkgs,
  lib,
  stdenv,
  ...
}: let
  inherit (pkgs) stdenv;

  node_pkgs = with pkgs; [
    nodejs-14_x
    yarn
    yarn2nix
    tree-sitter
    pkgs.nodePackages.neovim
    pkgs.nodePackages.ts-node
  ];

  python_pkgs = with pkgs; [
    python3
    pkgs.python3Packages.pynvim
    poetry
  ];

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

  cf_tool = stdenv.mkDerivation rec {
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
      license = with licenses; [];
      platforms = platforms.all;
      maintainers = with maintainers; [];
    };
  };
in
  with pkgs;
    [
      gh
      lazygit
      hugo
      cf_tool
      dbeaver
    ]
    ++ node_pkgs
    ++ python_pkgs
    ++ rust_pkgs
