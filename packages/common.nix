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
    version = "v0.9.0-dev-878+g6c39edaa7";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "nightly";
      sha256 = "sha256-UkEa4LKXLNglbn5U2o/zee9AePaVVzLkhe06rv6jtDg=";
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
