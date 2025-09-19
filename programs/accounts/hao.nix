{ lib, pkgs, ... }:
{
  programs.tmux = {
    shell = "${pkgs.fish}/bin/fish";
  };
  home = {
    username = "hao";
    homeDirectory = "/home/hao";
  };

  home.packages = with pkgs; [
    unzip
    fio
    btop
    killall
    heaptrack
    duckdb
    httpie
    motrix
    codex
    tokei
    cargo-edit
    cargo-insta
    uv
    samply
    ripgrep
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "adwaita";
      preset = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
    };
  };

  programs.git = {
    enable = true;
    userName = "XiangpengHao";
    userEmail = "me@xiangpeng.systems";
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "XiangpengHao";
        email = "me@xiangpeng.systems";
      };
    };
  };
}
