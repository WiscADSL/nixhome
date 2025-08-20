{ pkgs, ...}: {
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      daemon.enabled = pkgs.stdenv.hostPlatform.isLinux;
    };
  };
}
