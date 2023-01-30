{pkgs, ...}: {
  virtualisation = {
    docker = {
      enable = false;
      rootless = {
        enable = false;
        setSocketVariable = true;
      };
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    virtualbox.host = {
      enable = true;
      enableExtensionPack = false;
    };
  };
}
