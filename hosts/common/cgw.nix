{ pkgs, ... }:
{
  programs.bash.enable = true;
  users.users.cgw = {
    isNormalUser = true;
    shell = pkgs.bash;
    description = "Caeden Whitaker";
    extraGroups = [
      "docker"
      "wheel"
      "disk"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILepR3XAJGbqqUP/HAwlri8pxCJRaJ+P12xJoRbG/bWT caeden.whitaker@wisc.edu"
    ];
  };
}
