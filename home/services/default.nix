{
  pkgs,
  homeDirectory,
  ...
}: {
  flameshot.enable = true;
  mpd = {
    enable = true;
    musicDirectory = "${homeDirectory}/Music/";
    playlistDirectory = homeDirectory + "/Music/";
    network = {
      listenAddress = "any";
    };
    extraConfig = ''
      audio_output {
        type "pulse"
        name "mpd-test"
      }

      audio_output {
          type                    "fifo"
          name                    "my_fifo"
          path                    "/tmp/mpd.fifo"
          format                  "44100:16:2"
      }
    '';
  };
}
