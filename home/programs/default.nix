{
  config,
  pkgs,
  lib,
  configHome,
  ...
}: let
  inherit configHome;
  zsh = import ./zsh {inherit config pkgs lib configHome;};
in {
  inherit (zsh) zsh starship;
  home-manager.enable = true;
  direnv.enable = true;
  bat.enable = true;

  fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultCommand = "fd --type file --follow"; # FZF_DEFAULT_COMMAND
    defaultOptions = ["--height 20%"]; # FZF_DEFAULT_OPTS
    fileWidgetCommand = "fd --type file --follow"; # FZF_CTRL_T_COMMAND
  };

  htop = {
    enable = true;
    settings = {
      sort_direction = true;
      sort_key = "PERCENT_CPU";
    };
  };

  jq.enable = true;

  obs-studio = {
    enable = true;
    plugins = [pkgs.obs-studio-plugins.wlrobs];
  };
  go = {
    enable = true;
  };

  ssh.enable = true;
  git = {
    enable = true;
    userName = "MSBarbieri";
    userEmail = "matheussouzabarbieri@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      ci = "commit";
      co = "chekcout";
      s = "status";
      wa = "worktree add";
      wl = "worktree list";
      bc = "clone --bare";
    };
  };


  tmux = import ./tmux {inherit config pkgs;};
}
