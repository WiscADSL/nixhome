{ lib, pkgs, ... }: {
  programs.tmux = {
    shell = "${pkgs.bash}/bin/bash";
  };
  home = {
    username = "cgw";
    homeDirectory = "/home/cgw";
  };

  home.packages = with pkgs; [
    unzip
    fio
    cmake
    htop
    tmux
  ];

  programs.git = {
    enable = true;
    userName = "CaedenWhitaker";
    userEmail = "caeden.whitaker@gmail.com";
  };

}
