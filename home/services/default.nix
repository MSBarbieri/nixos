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

  redshift = {
    enable = true;
    provider = "manual";
    settings = {
      redshift = {
        brightness-day = "1";
        brightness-night = "1";
        transition=1;
        gamma="1.000:1.000:1.000";
        temp-day = 5500;
        temp-night = 3700;
        location-provider="manual";
      };
      manual = {
        lat = -23.456842;
        lon = -46.648923;
      };
    };
  };
}
