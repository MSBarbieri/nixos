{
  config,
  pkgs,
  ...
}: let
  plugins = pkgs.tmuxPlugins // pkgs.callPackage ./custom-plugins.nix {};
  tmuxConf = builtins.readFile ../../../res/home/tmux.conf;
in {
  enable = true;
  aggressiveResize = true;
  baseIndex = 1;
  extraConfig = tmuxConf;
  escapeTime = 0;
  keyMode = "vi";
  terminal = "screen-256color";
  plugins = with plugins; [
    sensible
    {
      plugin = themepack;
      extraConfig = ''
        set -g @themepack 'powerline/default/gray'
        set -goq @theme-window-status-current-bg colour245
        set -goq @theme-window-status-current-fg Grey3
      '';
    }
    resurrect
    {
      plugin = continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-boot 'on'
        set -g @continuum-boot-options 'kitty'
      '';
    }
  ];
}
