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

  services.k3s = {
    enable = true;
    role = "server";
    package = pkgs.k3s;
    extraFlags = builtins.toString [
      # "--disable" "coredns"
      "--disable" "local-storage"
      "--disable" "metrics-server"
      "--disable" "servicelb"
      "--disable" "traefik"
      "--pause-image" "test.local/pause:local"
    ];
  };

  services.freshrss = {
    enable = true;
    baseUrl = "localhost";
    passwordFile = pkgs.writeText "password" "secret";
    # dataDir = "/srv/freshrss";
  };
}
