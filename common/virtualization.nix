{pkgs, ...}: {
  virtualisation = {
    docker = {
      enable = true;
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
