{pkgs, ...}: let
  kitty = pkgs.kitty.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "kovidgoyal";
      repo = "kitty";
      rev = "refs/tags/v0.26.5";
      sha256 = "sha256-UloBlV26HnkvbzP/NynlPI77z09MBEVgtrg5SeTmwB4=";
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
    neovim
    fd
  ]
