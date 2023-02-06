{pkgs, ...}: {
  home.file.".config/gh/config.yml".source = ../res/home/gh.yml;
  home.file.".config/hypr/hyprland.conf".source = ../res/home/hypr/hyprland.conf;
  home.file.".config/hypr/binds.conf".source = ../res/home/hypr/binds.conf;
  home.file.".config/kitty/kitty.conf".source = ../res/home/kitty.conf;
  home.file.".config/lazygit/config.yml".source = ../res/home/lazygit/config.yml;
  home.file.".config/swaylock/config".source = ../res/home/swaylock;
  home.file.".config/swayidle/config".source = ../res/home/swayidle;
}
