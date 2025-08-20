# env

My [Nix](https://nixos.org/) environment. Once you have Nix installed, the first step is to clone this repo:

```sh
nix-shell -p git gh --run "gh auth login && gh repo clone aoli/env ~/repos/env"
```

There are separate configurations for the two different machines I use.

## [Desktop](desktop)

Run these commands to setup the NixOS configuration:

```sh
sudo nixos-rebuild switch --flake .#machine-name
```

Then run these commands to do a [standalone installation of Home Manager][home-manager standalone] and setup the Home Manager configuration:

```sh
nix run home-manager/master -- switch --flake .#aoli@linux
```

## [MacBook](macbook)

[Enable flakes](https://wiki.nixos.org/wiki/Flakes#Other_Distros,_without_Home-Manager) by making sure this line is present in `/etc/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

Then run these commands to do a [standalone installation of Home Manager][home-manager standalone] and setup the Home Manager configuration:

```sh
nix run home-manager/master -- switch --flake .#aoli@darwin
home-manager switch --flake .#aoli@darwin
```

[home-manager standalone]: https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone
