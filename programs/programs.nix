{ pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./gh
    ./starship
  ];

  home.packages =
    [
      pkgs.codex
      pkgs.claude-code
      pkgs.nix-index
      pkgs.killall
      pkgs.dive
      pkgs.podman-tui
      pkgs.yazi
      pkgs.jujutsu
      pkgs.jjui
      pkgs.starship
      pkgs.git-remote-hg
      pkgs.unzip
      pkgs.fish
      pkgs.nil
      pkgs.cloc
      pkgs.fastfetch
      pkgs.gh
      pkgs.git
      pkgs.git-lfs
      pkgs.byobu
      (pkgs.python3.withPackages (ps:
        with ps; [
          numpy
          matplotlib
          scipy
          seaborn
          ipython
        ]))
      pkgs.wget
      (pkgs.symlinkJoin {
        name = config.home.username;
        paths = [
          (pkgs.writers.writePython3Bin "shell"
            {
              libraries = [
                pkgs.python3Packages.gitpython
              ];
            }
            ./bin/shell.py)
        ];
      })
    ]
    ++ pkgs.lib.optionals (pkgs.stdenv.isLinux) [
      pkgs.gnupg
    ];
}
