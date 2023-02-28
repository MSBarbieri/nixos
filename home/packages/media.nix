{pkgs, ...}:
with pkgs; [
  vlc
  pulsemixer
  playerctl
  spotify-tui
  mpv
  spotify
  (ncmpcpp.override {
    visualizerSupport = true;
    clockSupport = true;
  })
  mpc-cli
]
