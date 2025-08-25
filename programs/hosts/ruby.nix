{ pkgs, lib, ... }: {
  wayland.windowManager.hyprland.extraConfg = "
    monitor=HDMI-A-4, 2560x1440@60, 0x0, 1.5
    monitor=DP-6, 2560x1440@60, 2560x0, 1.5, transform, 1
    ";
}
