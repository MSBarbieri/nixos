{pkgs, ...}: {
  security.pam.services.swaylock = {};

  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      enableExtraSocket = true;
      pinentryFlavor = "curses";
    };
  };
}
