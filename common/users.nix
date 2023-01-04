{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.sessionVariables = rec {
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  users.users.matheus-barbieri = {
    isNormalUser = true;
    description = "matheus barbieri";
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd" "video" "audio"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
