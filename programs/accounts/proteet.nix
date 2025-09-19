{ lib, pkgs, ... }:
{
  programs.tmux = {
    shell = "${pkgs.bash}/bin/bash";
  };
  home = {
    username = "proteet";
    homeDirectory = "/home/proteet";
  };

  home.packages = with pkgs; [
    unzip
    fio
    cmake
    libgcc
    bcc
    liburing
    spdk
    rustc
    cargo
    htop
    tmux
  ];

  programs.git = {
    enable = true;
    userName = "proteetpaul";
    userEmail = "proteetpaul@gmail.com";
  };

}
