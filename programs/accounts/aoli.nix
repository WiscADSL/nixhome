{ lib, pkgs, ... }: {
  home = {
    username = "aoli";
    homeDirectory =
      if (pkgs.stdenv.isDarwin)
        then "/Users/aoli"
      else "/home/aoli";
  };
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
  ] ++ lib.optionals (pkgs.stdenv.isLinux) [
      jetbrains.idea-community-bin
    ];

  programs.git = {
    enable = true;
    userName = "aoli-al";
    userEmail = "aoli.al@hotmail.com";
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "aoli-al";
        email = "aoli.al@hotmail.com";
      };
    };
  };
  wayland.windowManager.hyprland.extraConfig = "
      monitor=DP-6, 3840x2160@240, 0x0, 1.5
    ";
}
