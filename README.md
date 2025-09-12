# NixOS configuration for `adsl-ssd`

IP: `128.105.102.153`

Hostname: `adsl-ssd`

User group: slack channel `#adsl-ssd-users` in UW Madison Systems Group.

## Manners

1. Be a reasonable person, coordinate before using a lot of resources.
2. Unless specifically requested, DO NOT DEVELOP on the machine, it is used for BENCHMARK only. 
3. Do not store anything important on the machine, it can be deleted anytime without notice. Only configurations in this repo are persisted across reinstall. 

## Add a new user

1. First, learn some [nix basics](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-9), [cheatsheet](https://nixcademy.com/downloads/cheatsheet.pdf).

2. Add your user configuration to `hosts/common/[your-username].nix`

3. If you'd like to use home-manager, add your home configuration to `programs/accounts/[your-username].nix`

4. Send the pull request and ping the admins (as of Sep 2025, @XiangpengHao, @MikeWalrus) for review.

## Fresh setup 

[NixOS](https://nixos.org/) environment for ADSL's new SSD machine. 

Once you have Nix installed, the first step is to clone this repo:

```sh
nix-shell -p git gh --run "gh auth login && gh repo clone WiscADSL/nixhome ~/repos/nixhome"
```

To setup NixOS configuration:
```sh
sudo nixos-rebuild switch --flake .#adsl-ssd
```

To setup user configuration:

```sh
nix run home-manager/master -- switch --flake .#user-name@linux
```

