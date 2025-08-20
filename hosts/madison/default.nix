{pkgs, ...}: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = true;
    })
    ../common/hao.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "xiangpeng-madison";
  time.timeZone = "America/Chicago";
}
