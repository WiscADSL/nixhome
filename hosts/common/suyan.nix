{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users.users.suyan = {
    isNormalUser = true;
    uid = 1003;
    shell = pkgs.bash;
    description = "Suyan Qu";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4kGe7VCd9gGHQEeiNz3Q4Fl8s/o7SBw/tsNLwxGKesunLDe1QySk+EU4i7o5OT73uN3Xe0VpDmzecNAgh6Yoi6Kpqh85Z1QrF8B/avywL4dOymMA5Qp34Y7rVulyhW9FE3Q/FoE7BgdSEdHU9Pzktil+YCXOOsFMBF7ax7WG3bBXO7oOyJvFW9/TPbiEro2I9FD9Vc+CvsfwdMpqMqfTz6sq17nbE1/sJiGyU4QX7g9VIahrg0ZQbO/OBC2o4cZSLzLQaxVPLySCZCddOKeH1g5HmHUd9ng6rCrgrFyTIIx2HNwTNwy5C9I4OXVwSNlQ0bI45dg3ZmtA5DPAZyFv+c+4P2Sbl0TWyDPpfiaiqrslgf5bpZ2SaLE7YCSYEPGP1+fUad8BPWTJTIcp76isvx0gl583VQmFgJnmYn6p7MR8Q2cm71maV2/dUrrHPnsHTdOJP/xMqgxlZaCEwi2o9ZJDY8tixSlL428rsSXYLjyvAgH1JvAMdfkK2XOLTo+c= qusuy@DESKTOP-AR4BGJ3"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrmDJSZdsRYKcECONtUYSzm/U/+Etqu71qxXvlypk1NPRvxDQKvy8FLCFBKklVNCXG0/5qhbhZR2XdZ0U5r5hM8XRcUci6niW88680um6jvc5GuCFaYCwq7DRBu7rnyV2mC65wkJQ9TMr4B8cKTSBzIzMrXu4a5+rrAw00Dvx+244bKTiC16ieZfuTUd0tLjoYflNQUoddXELBQY1FMKyXPBITKsP/ye9b3INub3Jp9hTyuShdQ3HNMLp1FkGxhys6q2CilAjfvE9yuzXFwUVY9U2w+c+/eYOVBCmuzQIdM1YLhOahy/RB6gEkitxa6K+r1eD78LJKNvTsLlltrrG73gZHlgDT8Ug0WXphVOxN4O2UOS5YB1aMXgPKTJSPltEFI4nO7d06yD70tpX/kKvLL3H7nw5qm3ky1tTmmbaOY4IyeGn6vAyLiDPy2mgwGD2PvjjxF1AJuXtznpODZnCV+bzfF31kZbmeUbYOivBbN19J/idcyvy+7O++0sF5yz0= qusuy@TABLET-VR52TRTI"
    ];
  };
}
