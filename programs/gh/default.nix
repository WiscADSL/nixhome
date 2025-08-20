{
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "aoli-al";
    userEmail = "aoli.al@hotmail.com";
    extraConfig = {
      pull.rebase = false;
    };
    ignores = [
      ".venv/"
      ".direnv/"
      "*.swp"
      "*.swo"
      "*.iml"

      "build/"
      ".idea/"
      "__pycache__/"

      "*.pyc"
      "nohup.out"
      ".DS_Store"
      ".vscode/"

      "*-virtualbox/"
      ".antlr/"
      "result"
      "server exited unexpectedly"
    ];
  };
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "aoli-al";
        email = "aoli.al@hotmail.com";
      };
      revset-aliases = {
        "immutable_heads()" = "present(trunk()) | tags()";
      };
      ui = {
        always-allow-large-revsets = true;
      };
    };
  };

}
