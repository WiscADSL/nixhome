{ lib, pkgs, ... }: {
  home = {
    username = "aoli";
    homeDirectory =
      if (pkgs.stdenv.isDarwin)
      then "/Users/aoli"
      else "/home/aoli";
  };
  home.packages = with pkgs; [
      jetbrains.idea-ultimate
  ] ++ lib.optionals (pkgs.stdenv.isLinux) [
      jetbrains.idea-community-bin
  ];
}
