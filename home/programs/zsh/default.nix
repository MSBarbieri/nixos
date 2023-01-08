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
  };

  starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
    };
  };
}
