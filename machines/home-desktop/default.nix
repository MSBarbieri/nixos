{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = true;
      efi = {
        efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
    };
  };

  networking = {
    hostName = "home-desktop";
    extraHosts = ''
      127.0.0.1 instagram.com
      127.0.0.1 tiktok.com
      # 127.0.0.1 youtube.com
      # 127.0.0.1 www.youtube.com
      # 127.0.0.1 twitch.tv

      # 127.0.0.1 www.twitch.tv

    '';
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
  };
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      nvidia-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
