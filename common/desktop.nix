{
  config,
  pkgs,
  user,
  desktop,
  ...
}: {
  services = rec {
    xserver = {
      enable = true;

      extraLayouts.my_us = {
        description = "my custom layout";
        languages = ["eng"];
        symbolsFile = ../res/my_us.xkb;
      };

      layout = "my_us";
      xkbVariant = "dvp";
      xkbOptions = "caps:swapescape";
      displayManager = {
        defaultSession = "none+awesome";
        sddm = {
          enable = true;
          autoLogin = {
            enable = desktop.autologin;
            user = user.username;
          };
        };
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
        ];
      };
    };
    gvfs.enable = true;
  };

  programs.gnome-disks.enable = true;
}
