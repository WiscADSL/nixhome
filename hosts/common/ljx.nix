{
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  users.users.ljx = {
    isNormalUser = true;
    uid = 1001;
    shell = pkgs.zsh;
    description = "Junxuan Liao";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD/KSdQh2qTML1FITu4EDlDR6gOM93SQo6oT6Y6SGV1WdWbmB+kdwvf70yZWYgmg1WYD3wmjjhuAcZ60+3lDNV44U6CV9B9KZwb3jrbS3DIHfrpqxVC9n5WOUzYN4x/ofFVkv3d1oJRJ+ZfY1T90MvGps8NojmL9UhKnLjc5CVDRg1mqmFfW6MU315nqR2iX/Zq5EN7ASVmAK/2vLC24lo/2hP6YjAruTV11+1MlCayJTJRRrQFzlrIf8qskVN3G1Rh6U/RJ+djz+4ISYBjniFf+AB1hyNLS8eW5ljMqgSSoBfqaf3vm0wmc1rRonEjefaOBP0yJOkS6zikAZjNjFETshsIy0AAWHeoLOiM29TLOaqsRDaOkv0k20/44j3tVUq7eb1nDTylOnfbGyehfz16brlx3dvfDPp/M+dVjllyPbj/l8OZjPtDahkgPoHX25Cg0MwbVsZHx4cBmObXgLf09zf5Lxx3WPeKBKHDzwbrdRIoqxBdc2/+5yf4BscMY8= mike@oyster"
    ];
  };
}
