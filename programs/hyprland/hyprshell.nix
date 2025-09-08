{ inputs, ...}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    systemd.args = "-v";
    settings = {
      windows = {
        enable = true;
        overview = {
          enable = true;
          key = "super_l";
          modifier = "super";
          launcher = {
            max_items = 6;
            plugins.websearch = {
              enable = true;
              engines = [{
                name = "Google";
                url = "https://google.com/search?q=%s";
                key = "d";
              }];
            };
          };
        };
        switch.enable = false;
      };
    };
  };
}
