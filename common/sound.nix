{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  };
}
