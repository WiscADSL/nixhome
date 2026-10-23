{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users.users.ctj = {
    isNormalUser = true;
    uid = 1008;
    shell = pkgs.zsh;
    description = "Tingjia Cao";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC098oKC67NXRyvBp/vYAFoCifdxeFrhAwlDhmukDZTU+howP7vHZruzcQ/bI8PBLWoM41aoIRKx039ICrjeHIhjG55BLM7BV2Og2HI3/qZdpLzkRLImEn82jA8o8l5VxAtZvYhTYfzMP6PLJVIFry/nDFx7VSNrdd6kDO21J8N2OcvPchCPKeJ079jRE6PttqOX++94mmnZu8w4GTbRVyjpIYkfBPDOVdc8KH+AhjM6Jt49jVnfmY7qirLt0yFtBJrWw+gG35YxP/4h7hGHtniLtSI5enks/UYRnA1HdOxEKurB0y5+Kl28pka/QVTFCj46RLZgBLqDivKffsesGQzpUDt71gqRVFOf5WC4dpjsSEWgJeBuegA6zkU1Ce8gkB/70uWSuKw9jE1Xtc/79JlS7Zi8AAkxd+5DYt0LFxNfHcNj35gKF0JKkNvDR+MFiLlIkOJuhrUsX5ubIuatcBgeebRMiOVofYMMcd5D4gkGBIb7qeWMwxHX+ULo089xTfRbczE0wKyUmxDJSJkDFKKd2ujN7xY5JZj6cF7SRVJmAY9vDs7+QWTelX9PIxzIyFDCEZkCkogIUpfqVQwiWLc0Ubqodi5BDp1R5o7dIPx0okHc5Lk22cjlG4ZAwas6Jmzli33G1Tg2UOdxlJiB6EpGGlQSIsXpyoGpMEgc32f9Q== tjcao980311@gmail.com"
    ];
  };
}
