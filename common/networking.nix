{
  config,
  pkgs,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openvpn];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [6443];
    };
  };

  services = {
    openssh = {
      enable = true;
      allowSFTP = true;
    };

    sshd.enable = true;
  };
}
