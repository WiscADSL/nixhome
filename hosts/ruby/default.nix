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

  systemd.services.kanata-default.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards.default = {
      config =  builtins.readFile ./logic.kbd;
      devices = [
        "/dev/input/by-id/usb-Topre_REALFORCE_87_US-event-kbd"
      ];
    };
  };

}
