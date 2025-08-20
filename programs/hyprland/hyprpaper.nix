{pkgs, ...}: {
  services.hyprpaper = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      ipc = "off";
      splash = false;
      preload = [
        "${./imgs/octal.jpg}"
        "${./imgs/hex.jpg}"
      ];
      wallpaper = [
        ", ${./imgs/octal.jpg}"
        ", ${./imgs/hex.jpg}"
      ];
    };
  };
  programs.hyprlock = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        no_fade_out = false;
        ignore_empty_input = true;
      };
      background = [
        {
          path = "${./imgs/octal.jpg}";
          blur_passes = 0;
          blur_size = 0;
        }
      ];
    };
  };
}
