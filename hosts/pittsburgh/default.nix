{pkgs, ...}: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = true;
    })
    ../common/hao.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "xiangpeng-pittsburgh";
  time.timeZone = "America/New_York";
}
