{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users.users.hao = {
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.fish;
    description = "Xiangpeng Hao";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDc0aTBwz/1PRSY1dad91rl4mOhp625D8jm8PtBmo6yuNLlQTXE7vBWS4lCgCc9QCIP3nPk6b3Cc6NooCyq5zh4MVNvtYn+MWpXOSEG6jkBQdKXSrkT708v0b3xqgT5aMtNygP1x629SwPUiPUbyOUkqILuC4IVVwUB9ugz5BDOUsFRmuUkOcLdMYnWQliSQ/bIXHAf/X6S8u9Ajb4QmWL16IQQlZ8OKpNEDGskkNjGcx5buBz9MiBoXJYZCXISUrsrMOowVZL5y2DF17/hNoWJxpDy1T/ALzfegESMBUXY3/CW9mnDe0zsL51lx6lBML2vviKmVwVyUn184FaIuHvTEZ1tJB73emtRtH1Hk8Hhe2Cd8u1fE4oIBQ93f5sLKVytOqWH2Bm511NoDV3TgEvd9JhxlbrQkYqPZAwsM+HRwzxzHkNcfSb+c2e+AH+DpF+4TgdVXJ7TjLapV6P85SCiuPVKNvRF+X9L5ez0N3GvzHa/w6tzjLtTICskMRRncpU="
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF1GHapK3qlBfJOAnxj3yolJa6ll1DbrC4OwEeya1DW"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINo3/3dfsnQvaFW+hG63w+rOmngogaXtzYoi3/rbOdD6"
    ];
  };
}
