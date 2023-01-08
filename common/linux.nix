{pkgs, ...}: {
  system.autoUpgrade.enable = true;

  # Configure console keymap
  console.keyMap = "dvorak";

  programs.dconf.enable = true;
  programs.adb.enable = true;

  services.dbus = {
    enable = true;
    packages = [pkgs.dconf];
  };

  system.stateVersion = "22.11"; # Did you read the comment?
}
