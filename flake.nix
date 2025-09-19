{
  description = "My Nix environment";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nur.url = "github:nix-community/nur";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      vscode-server,
      nur,
      catppuccin,
      ...
    }@inputs:
    let
      pkgsX86 = import nixpkgs {
        system = "x86_64-linux";
      };
      pkgsArm = import nixpkgs {
        system = "aarch64-darwin";
      };

      # Import shells function properly
      importShells = pkgs: import ./shells.nix pkgs;
    in
    {
      packages = home-manager.packages; # Support bootstrapping Home Manager.

      nixosConfigurations = {
        "adsl-ssd" = nixpkgs.lib.nixosSystem {
          modules = [
            nur.modules.nixos.default
            vscode-server.nixosModules.default
            ./hosts/adsl-ssd
          ];
        };
      };

      homeConfigurations = {
        "hao@linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsX86;
          modules = [
            ./programs/accounts/hao.nix
            ./home.nix
            nixvim.homeModules.nixvim
            catppuccin.homeModules.catppuccin
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };

      # Properly structure devShells
      devShells = {
        "x86_64-linux" = importShells pkgsX86;
        "aarch64-darwin" = importShells pkgsArm;
      };
    };
}
