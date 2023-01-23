{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    fonts = with pkgs; [
      nerdfonts
      fira-code
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      corefonts
    ];
    fontconfig = {
      enable = true;
    };
  };
}
