{
  pkgs,
  ...
}:
{
  programs.bash.enable = true;
  users.users.proteet = {
    isNormalUser = true;
    uid = 1002;
    shell = pkgs.bash;
    description = "Proteet Paul";
    extraGroups = [
      "docker"
      "wheel"
      "disk"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKDqaQHnz1TEdQvpUHgF1kXoCV0dNRauso/Z7toJBg05 Access to ADSL ssd"
    ];
  };
}
