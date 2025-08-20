{ pkgs, ... }: {
  programs.browserpass.enable = true;
  services.gnome-keyring.enable = pkgs.stdenv.isLinux;
  services.gpg-agent.enable = pkgs.stdenv.isLinux;
  services.gpg-agent.pinentry.package = pkgs.pinentry-gnome3;
}
