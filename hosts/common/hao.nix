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
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINo3/3dfsnQvaFW+hG63w+rOmngogaXtzYoi3/rbOdD6"
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBZ48C66n+ufpKM3jVhby+eUBE4ZmiEc1Xa1nGOVJIAa"
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWHg5wa4nzGfoupxbYPnbspSBg45ETQYQUlYwYCi7v7"
    ];
  };
}
