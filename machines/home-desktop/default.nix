{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
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
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      nvidia-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

}
