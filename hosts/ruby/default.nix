{ pkgs, ... }: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = true;
    })
    ./hardware-configuration.nix
    ../common/aoli.nix
  ];
  networking.hostName = "ruby";
}
