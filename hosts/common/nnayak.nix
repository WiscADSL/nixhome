{ pkgs, ... }:
{
  programs.bash.enable = true;
  users.users.nnayak = {
    isNormalUser = true;
    uid = 1007;
    shell = pkgs.bash;
    description = "Nikhil Nayak";
    extraGroups = [
      "docker"
      "wheel"
      "disk"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJfy7TaP29ywu6vVuIL1zxbOEa+YrAL/+5blT5x+MWiu nnayak7@wisc.edu"
    ];
  };
}
