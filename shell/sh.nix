{ ... }:
{
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
    ".byobu/.tmux.conf" = {
      source = ../dotfiles/tmux.conf;
      force = true;
    };
    ".config/jjui/config.toml" = {
      source = ../dotfiles/jjui.toml;
      force = true;
    };
    ".local/share/fcitx5/rime/default.custom.yaml" = {
      source = ../dotfiles/rime.yaml;
      force = true;
    };
  };
}
