{pkgs, ...}: let
  buildTmuxPlugin = pkgs.tmuxPlugins.mkTmuxPlugin;
in {
  themepack = buildTmuxPlugin {
    pluginName = "themepack";
    version = "1.1.0";
    src = builtins.fetchTarball {
      name = "Themepack-Tmux";
      url = "https://github.com/jimeh/tmux-themepack/archive/refs/tags/1.1.0.tar.gz";
      sha256 = "00dmd16ngyag3n46rbnl9vy82ih6g0y02yfwkid32a1c8vdbvb3z";
    };
  };
}
