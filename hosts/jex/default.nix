{ pkgs, ... }: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = false;
    })
    ./hardware-configuration.nix
    ../common/aoli.nix
  ];

  networking.hostName = "jex";
}
