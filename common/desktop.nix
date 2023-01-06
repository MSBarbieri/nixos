{
  config,
  pkgs,
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
        sddm.enable = true;
        defaultSession = "none+awesome";
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
}
