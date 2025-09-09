{ pkgs, ... }: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = false;
    })
    ./hardware-configuration.nix
    ../common/aoli.nix
  ];
  services.logind = {
    lidSwitch = "suspend";
  };
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
    };
  };

  networking.hostName = "jex";
}
