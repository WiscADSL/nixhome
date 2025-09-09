{ pkgs, ... }: {
  wayland.windowManager.hyprland.extraConfig = "
    monitor=eDP-1, 1920x1200@60, 0x0, 1.25
    ";
  
  services.hypridle.settings.listener = [
    {
      timeout = 600;  # Suspend after 10 minutes (only on jex)
      on-timeout = "systemctl suspend";
    }
  ];
}
