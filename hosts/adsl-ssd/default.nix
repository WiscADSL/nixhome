{pkgs, ...}: {
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = true;
    })
    ../common/hao.nix
    ../common/ljx.nix
    ../common/proteet.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "adsl-ssd";
  time.timeZone = "America/Chicago";

  boot.kernelParams = [ "nvme.poll_queues=32" ];

  programs.zsh.enable = true;

  environment.systemPackages = [
    pkgs.btrfs-progs
    pkgs.xfsprogs
    pkgs.btop
    pkgs.htop
    pkgs.fio
    pkgs.linuxPackages_latest.perf
  ];

  systemd.targets.machines.enable = true;
  systemd.nspawn."archlinux-1" = {
    enable = true;
    execConfig = {
      Boot = true;
      Environment = "SYSTEMD_SECCOMP=0";
      Capability = "all";
      Hostname = "adsl-ssd-arch";
      ResolvConf = "bind-host";
      PrivateUsers = "no";
    };

    filesConfig = {
      # Bind resolve.conf to get networking
      # BindReadOnly = ["/etc/resolv.conf:/etc/resolv.conf"];
      # Bind any directories that you want to be shared
      Bind = [
        "/dev/disk:/dev/disk"
        "/dev/nvme0n1:/dev/nvme0n1"
        "/dev/nvme1n1:/dev/nvme1n1"
        "/dev/nvme2n1:/dev/nvme2n1"
        "/dev/nvme3n1:/dev/nvme3n1"
        "/dev/nvme4n1:/dev/nvme4n1"
      ];
    };
    networkConfig = {Private = false;};
  };
  systemd.services."systemd-nspawn@archlinux-1" = {
    enable = true;
    requiredBy = ["machines.target"];
    overrideStrategy = "asDropin";
    environment = {
      SYSTEMD_SECCOMP = "0";
    };
  };

  networking.firewall.allowedTCPPorts = [ 2201 ];
}
