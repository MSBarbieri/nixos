{pkgs, ...}: let
  kitty = pkgs.kitty.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "kovidgoyal";
      repo = "kitty";
      rev = "refs/tags/v0.26.5";
      sha256 = "sha256-UloBlV26HnkvbzP/NynlPI77z09MBEVgtrg5SeTmwB4=";
    };
  });

  nvim = pkgs.neovim-unwrapped.overrideAttrs (old: {
    version = "v0.9.0-dev-1059+g2c9fbe34b";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "nightly";
      sha256 = "sha256-MgUEDPza573qKV59nRqrykLblPKBZu+DAIUqg9Pl5wU=";
    };
  });

in
  with pkgs; [
    curl
    jq
    ripgrep
    unzip
    zip
    xclip
    wget
    bat
    exa
    git
    zsh
    stow
    killall
    pciutils
    ffmpeg
    firefox
    kitty
    nvim
    fd
    dnsutils
  ]
