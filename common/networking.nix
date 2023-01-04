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
    firewall.enable = false;
  };

  services = {
    openssh = {
      enable = true;
      allowSFTP = true;
    };

    sshd.enable = true;
  };
}
