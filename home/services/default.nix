{
  pkgs,
  user,
  ...
}: {
  flameshot.enable = true;
  mpd = {
    enable = true;
    musicDirectory = "${user.home}/Music/";
    playlistDirectory = user.home + "/Music/";
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
