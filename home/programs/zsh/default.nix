{
  pkgs,
  configHome,
  ...
}: let
  inherit configHome;
in {
  zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      ls = "exa --icons";
      ll = "ls -l";
      la = "ls -la";
      bat = "bat --color=auto";
      cat = "bat";
      lg = "lazygit";
      g = "git";
      k = "kubectl";
      update = "sudo nixos-rebuild switch --flake '${configHome}/nixos#home-desktop'";
      v = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "docker" "kubectl" "tmux" "vi-mode" "fzf"];
    };
  };

  starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      nix_shell.disabled = false;
      nix_shell.impure_msg = "[impure shell](bold red)";
      nix_shell.pure_msg = "[pure shell](bold green)";
      nix_shell.format = "via [☃️ $state( \($name\))](bold blue) ";
    };
  };
}
