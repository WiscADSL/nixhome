{ lib, pkgs, ... }: {
  programs.tmux = {
    shell = "${pkgs.fish}/bin/fish";
  };
  home = {
    username = "hao";
    homeDirectory = "/home/hao";
  };

  home.packages = with pkgs; [
    code-cursor
    tokei
  ];
}