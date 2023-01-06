{
  pkgs,
  configHome,
  ...
}: let
  inherit configHome;
in {
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  enableSyntaxHighlighting = true;

  shellAliases = {
    ls = "exa --icons";
    ll = "ls -l";
    bat = "bat --color=auto";
    cat = "bat";
    lg = "lazygit";
    g = "git";
    k = "kubectl";
    update = "sudo nixos-rebuild switch --flake '${configHome}/nixos#home-desktop'";
    v = "nvim";
    system = "nvim ${configHome}/nixos/flake.nix";
    home = "nvim ${configHome}/nixos/home/default.nix";
    pip = "PIP_PREFIX='$(pwd)/_build/pip_packages' \pip";
  };

  oh-my-zsh = {
    enable = true;
    plugins = ["git" "sudo" "docker" "kubectl" "tmux" "vi-mode" "fzf"];
    theme = "mytheme";
    custom = "${configHome}/nixos/home/programs/zsh/scripts/";
  };
}
