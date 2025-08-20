{ pkgs, config, ... }:
let
  symlink = subpath: {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/env/${subpath}";
    force = true;
  };
in {
  programs = {
    bat.enable = true;

    eza.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home-manager.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };
  };

  home.file = { 
    ".byobu/.tmux.conf" = symlink "dotfiles/tmux.conf";
    ".config/jjui/config.toml" = symlink "dotfiles/jjui.toml"; 
  };
}
