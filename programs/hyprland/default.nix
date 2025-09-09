{ pkgs, lib, inputs, config, ... }: {
  imports = [
    ./bind.nix
    ./waybar.nix
    ./kitty.nix
    ./hyprpaper.nix
  ];
  home.packages = with pkgs; [
    kitty
    kitty-themes
  ] ++ lib.optionals stdenv.isLinux [
    waybar
    dunst
    rofi-wayland
    hyprlock
    hypridle
    hyprpaper
    grim
    slurp
    wl-clipboard
  ];

  xdg = {
    enable = pkgs.stdenv.isLinux;
    configFile."mimeapps.list" = lib.mkIf pkgs.stdenv.isLinux {
      force = true;
    };
    mime.enable = pkgs.stdenv.isLinux;
    mimeApps = {
      enable = pkgs.stdenv.isLinux;
    };
    portal = {
      enable = pkgs.stdenv.isLinux;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      configPackages = [pkgs.hyprland];
    };
  };


  services = {
    hypridle = {
      enable = pkgs.stdenv.isLinux;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprlock";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = pkgs.stdenv.isLinux;
    systemd.enable = pkgs.stdenv.isLinux;
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      decoration = {
        shadow.enabled = false;
        blur.enabled = false;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      input = {
        kb_options = "ctrl:nocaps";
        follow_mouse = 2;
      };
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
        no_border_on_floating = true;
      };
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
        };
      };
      windowrulev2 = [
        # IM
        "tag +im, class:^(org.telegram.desktop)$"
        "tag +im, class:^(.*Discord.*)$"
        "tag +im, class:^(.*Slack.*)$"
        "tag +im, class:^(.*zoom.*)$"
        "workspace special, tag:im*"

        # Game
        "tag +game, class:^(.*Steam.*)$"
        "tag +game, class:^(.*DotA.*)$"
        "tag +games, class:^(steam_app_\d+)$"
        "fullscreen, tag:games"

        # Screenshot utilities - disable animations and optimize performance
        "noanim, class:^(grim)$"
        "noanim, class:^(slurp)$"
        "noblur, class:^(slurp)$"
        "noshadow, class:^(slurp)$"
        "noborder, class:^(slurp)$"
        "immediate, class:^(slurp)$"

        "float, class:^(.*fcitx.*)$"
        "noinitialfocus, class:^(.*jetbrains.*)$, title:^(win.*)$"
        "nofocus, class:^(.*jetbrains.*)$, title:^(win.*)$"
        "noinitialfocus, class:^(.*jetbrains.*)$, title:^\\s$"
        "nofocus, class:^(.*jetbrains.*)$, title:^\\s$"
      ];
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "fcitx5 -d"
        "blueman-applet"
        "nm-applet --indicator"
        "hyprctl setcursor catppuccin-latte-red-cursors 30"
        "hyprshell run"
      ] ++ lib.optionals (config.programs.atuin.enable or false) [
        "atuin daemon&"
      ];
    };
  };
}
