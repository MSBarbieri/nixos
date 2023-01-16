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
    pkgs.python3Packages.pytest
    pkgs.python3Packages.pyflakes
    pkgs.python3Packages.black
    pkgs.python3Packages.setuptools
    pkgs.python3Packages.pip
    pkgs.python3Packages.pygobject3
    pkgs.python3Packages.gst-python
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
      sourceProvenance = with sourceTypes; [ binaryBytecode ];
      license = with licenses; [];
      platforms = platforms.all;
      maintainers = with maintainers; [];
    };
  };


  leetcode = pkgs.rustPlatform.buildRustPackage rec {
    pname = "leetcode";
    version = "0.3.12";

    src = pkgs.fetchgit {
      url = "https://github.com/MSBarbieri/leetcode-cli.git";
      rev = "refs/branches/master";
      sha256 = "sha256-Vp8+55kCX6ban97Pn5Yj6pnCeH2eLU+QbMWvb/+XJWE=";
    };

    cargoSha256 = "sha256-487xJrQOtgxPHA7MZxoMqb+7iGpLd29WVUiqnbcEuAo=";

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    buildInputs = with pkgs; [
      openssl
      dbus
      sqlite
    ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    meta = with pkgs.lib; {
      description = "Leet your code in command-line.";
      homepage = "https://github.com/clearloop/leetcode-cli";
      licenses = licenses.mit;
      maintainers = with maintainers; [ congee ];
      mainProgram = "leetcode";
    };
  };
in
  with pkgs;
    [
      gh
      lazygit
      hugo
      cf_tool
      leetcode
    ]
    ++ node_pkgs
    ++ python_pkgs
    ++ rust_pkgs
