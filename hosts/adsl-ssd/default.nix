{ pkgs, ... }:
{
  imports = [
    (import ../common {
      inherit pkgs;
      withNvidia = true;
    })
    ../common/hao.nix
    ../common/ljx.nix
    ../common/suyan.nix
    ../common/proteet.nix
    ../common/zixuan.nix
    ../common/kaiweitu.nix
    ../common/nnayak.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "adsl-ssd";
  time.timeZone = "America/Chicago";

  boot.kernelParams = [ "nvme.poll_queues=32" "iommu=off" "nvme_core.multipath=N" ];
  boot.swraid.enable = true;

  programs.zsh.enable = true;

 nixpkgs.overlays = [
    (final: prev: {
      llama-cpp = (prev.llama-cpp.override {
        cudaSupport = false;
        rocmSupport = false;
        metalSupport = false;
        blasSupport = true;
      }).overrideAttrs (oldAttrs: rec {
        version = "8198";
      src = pkgs.fetchFromGitHub {
        owner = "ggml-org";
        repo = "llama.cpp";
        tag = "b${version}";
        hash = "sha256-x+3tVC42Nnj1AJgorZBcIf9N/wEi/Yn/ba17xAuZUCk=";
        leaveDotGit = true;
        postFetch = ''
          git -C "$out" rev-parse --short HEAD > $out/COMMIT
          find "$out" -name .git -print0 | xargs -0 rm -rf
        '';
      };
      # Enable native CPU optimizations (AVX, AVX2, etc.)
      cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [
        "-DGGML_NATIVE=ON"
      ];
      # Disable Nix's march=native stripping
      preConfigure = ''
        export NIX_ENFORCE_NO_NATIVE=0
        ${oldAttrs.preConfigure or ""}
      '';
      });
    })
  ];

services.llama-cpp = {
	enable = false;
	model = "/srv/models/unsloth_Qwen3.5-35B-A3B-GGUF_Qwen3.5-35B-A3B-Q4_K_M.gguf";
	port = 11434;
	extraFlags = [ "--chat-template-kwargs" "{ \"reasoning_effort\" : \"low\" }" "--reasoning-budget" "0" ];
};

  services.ollama = {
	  enable = false;
	  # Optional: preload models, see https://ollama.com/library
	  loadModels = [ "qwen3.5:9b" "qwen3.5:35b-a3b-q4_K_M" ];
          port = 11434;
          host = "127.0.0.1";
  };

  services.nginx = {
    enable = false;
    proxyTimeout = "1000s";

virtualHosts."_" = {
  listen = [{ addr = "0.0.0.0"; port = 44354; }];

  locations."/" = {
    recommendedProxySettings = true;
    proxyPass = "http://127.0.0.1:11434";

    extraConfig = ''
      auth_basic "Restricted";
      auth_basic_user_file /var/lib/nginx/ollama.htpasswd;
    '';
  };
};
  };

  environment.systemPackages = [
    pkgs.btrfs-progs
    pkgs.xfsprogs
    pkgs.btop
    pkgs.htop
    pkgs.fio
    pkgs.linuxPackages_latest.perf
    pkgs.glibc
    pkgs.llama-cpp
  ];

  environment.enableDebugInfo = true;

  programs.mosh.enable = true;

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
    networkConfig = {
      Private = false;
    };
  };
  systemd.services."systemd-nspawn@archlinux-1" = {
    enable = true;
    requiredBy = [ "machines.target" ];
    overrideStrategy = "asDropin";
    environment = {
      SYSTEMD_SECCOMP = "0";
    };
  };

  networking.firewall.allowedTCPPorts = [
    2201
    8000
    44354
  ];

  virtualisation.docker.enable = true;

  security.pam.loginLimits = [
    {
      domain = "proteet";
      type = "soft";
      item = "memlock";
      value = "unlimited";
    }
    {
      domain = "proteet";
      type = "hard";
      item = "memlock";
      value = "unlimited";
    }
    {
      domain = "ljx";
      type = "soft";
      item = "memlock";
      value = "unlimited";
    }
    {
      domain = "ljx";
      type = "hard";
      item = "memlock";
      value = "unlimited";
    }
  ];
}
