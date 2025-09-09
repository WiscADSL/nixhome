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

  services.kanata = {
    enable = true;
    keyboards.default = {
      config =  builtins.readFile ./dell.kbd;
      devices = [
        "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
      ];
    };
  };
  networking.hostName = "jex";
}
