{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    # LD_PRELOAD="${pkgs.stdenv.cc.cc.lib}/lib/libstdc++.so.6";
    # LD_LIBRARY_PATH = "${pkgs.gcc-lib}/lib:$LD_LIBRARY_PATH";
  };
  users.users.matheus-barbieri = {
    isNormalUser = true;
    description = "matheus barbieri";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "video"
      "audio"
      "adbusers"
      "k3s"
      "couchdb"
    ];
    packages = [];
    shell = pkgs.zsh;
  };
}
