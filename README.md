# env

[NixOS](https://nixos.org/) environment for ADSL's new SSD machine. 

Once you have Nix installed, the first step is to clone this repo:

```sh
nix-shell -p git gh --run "gh auth login && gh repo clone WiscADSL/nixhome ~/repos/nixhome"
```

To setup NixOS configuration:
```sh
sudo nixos-rebuild switch --flake .#machine-name
```

To setup user configuration:

```sh
nix run home-manager/master -- switch --flake .#user-name@linux
```

## Add a new user
