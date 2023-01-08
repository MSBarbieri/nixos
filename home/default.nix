{
  config,
  lib,
  pkgs,
  stdenv,
  ...
}: let
  username = "matheus-barbieri";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
in {
  programs = import ./programs {inherit config pkgs lib configHome;};
  services = import ./services {inherit pkgs homeDirectory;};

  xdg = {
    inherit configHome;
    enable = true;
  };

  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";
    packages =
      (import ./packages {inherit pkgs lib;})
      ++ (import ./scripts {inherit pkgs;});

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "kitty";
      LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.stdenv.cc.cc.lib}/lib";
      PYTHONPATH = "$(pwd)/_build/pip_packages/lib/python3.7/site-packages:$PYTHONPATH";
    };
  };

  systemd.user.startServices = "sd-switch";

  news.display = "silent";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    font.name = "Fira Code Mono 12";
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      package = pkgs.colloid-icon-theme.overrideAttrs (old: {
        installPhase = ''
          runHook preInstall
              name= ./install.sh \
                --scheme all \
                --theme all \
                --dest $out/share/icons
              jdupes --quiet --link-soft --recurse $out/share
              runHook postInstall
        '';
      });
      name = "Colloid-purple-dracula-dark";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin-Mocha-Dark";
    };
  };

  imports = [(import ./files.nix)];
}
